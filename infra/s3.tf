resource "aws_s3_bucket" "example" {
  bucket = "${var.env}-butti-bucket"

  tags = {
    Name        = "${var.env}-butti-bucket"
    Environment = var.env
  }
}
