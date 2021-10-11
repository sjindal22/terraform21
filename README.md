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



