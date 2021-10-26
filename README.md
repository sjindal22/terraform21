# terraform21

## Note: I am using terraform verion 1.0.8 for this repo

## High level requirements

### Declare a provider
```
provider "provider_name" {
    attr1 = "a"
    attr2 = "b"
}
```

### Declare a recource 
```
resource "aws_instance" "ubuntu" {
    ami           =  "some_id"
    instance_type =  "m2.large"
}
```

### Install or upgrade terraform

Go [here](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)

### List of providers

Get started with your provided provider by going [here](https://registry.terraform.io/namespaces/hashicorp)

### Templates

* Used to manage interpolations in long strings or text files.
* They are defined as a data source
* Can be rendered using an output variable

data "data_source_type" "some_name" {
    // template strings can be files on disk, placeholders for values, etc 
    template = "$${username}, $${public_key}" || "$file(/path/to/terraform.tpl)"
    vars {
        // contains values to be rendered
        username = "John"
        public_key = "somekey"
    }
}

output "rendered" {
    value = "${data.data_source_type.some_name.rendered}
}

### Gotchas in the TF version 1.x.x+

* depends_on attribute does not requires quotes around references.
* Variable definition does not require quotes around *type* of the variable