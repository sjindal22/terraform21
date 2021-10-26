// To run the following resource, do "terraform plan -var 'aws_region=us-east-1'"
resource "aws_instance" "secondinstance" {
    // lookup(map, key)
    ami = "${lookup(var.webserver_amis, var.aws_region)}"
    instance_type = "t2.micro"
}

output "webserver_public_ip" {
    // resourceType.resourceName.attribute
    // Can be outputted by running, terraform output webserver_public_ip
    value = "${aws_instance.secondinstance.public_ip}"
}

// terraform plan -var target_env=prod
resource "aws_instance" "bastion" {
    ami = "${lookup(var.webserver_amis, var.aws_region)}"
    instance_type = "t2.micro"

    count = "${var.target_env == "dev" ? 0 : 1}"
}

output "bastion_ips" {
  value = "${aws_instance.bastion.*.private_ip}"
}

output "bastion_ip_0" {
  value = "${aws_instance.bastion.*.private_ip[0]}"
}

data "template_file" "webserver_policy_template" {
    template = "${file("${path.module}/policy.tpl")}"

    // 1.0.8 version requires an "=" sign here
    vars = {
        arn = "${resource.aws_instance.secondinstance.arn}"
    }
}

output "view_policy" {
   value = "${data.template_file.webserver_policy_template.rendered}"
}