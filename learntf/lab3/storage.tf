resource "aws_s3_bucket" "lab3_bins" {
    acl = "public-read"
}

output "bucket_name" {
    value = "${aws_s3_bucket.lab3_bins.bucket_domain_name}"
}