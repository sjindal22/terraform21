provider "aws" {
    access_key = "AKIAW7KO2EQNNNZG3EYU"
    secret_key = "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"
    region = "us-east-1"  
}

resource "aws_instance" "firstinstance" {
    ami = "ami-0747bdcabd34c712a"
    instance_type = "t2.micro"
  
}