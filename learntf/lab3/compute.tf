// To run the following resource, do "terraform plan -var 'aws_region=us-east-1'"
resource "aws_instance" "secondinstance" {
    // lookup(map, key)
    ami = "${lookup(var.webserver_amis, var.aws_region)}"
    instance_type = "t2.micro"
    subnet_id = "${aws_default_subnet.lab3_default_subnet.id}"

    depends_on = [
      aws_s3_bucket.lab3_bins
    ]
}

output "webserver_public_ip" {
    // resourceType.resourceName.attribute
    // Can be outputted by running, terraform output webserver_public_ip
    value = "${aws_instance.secondinstance.public_ip}"
}