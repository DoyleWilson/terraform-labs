resource "aws_s3_bucket" "bucket-terraform" {
  bucket = "bucket-terraform-doydemo"
  tags = {
    Name        = "bucket-terraform-doydemo"
    Environment = "dev"
  }
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer.${count.index}"
  path = "/system/"
  count = 3

  tags = {
    tag-key = "tag-value"
  }
}
