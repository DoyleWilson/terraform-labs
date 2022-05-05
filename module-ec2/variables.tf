variable "ec2_instance_type" {}

variable "instance_type_map" {
  type = map
  default = {
    us-east-1 = "t2.micro"
    us-east-2 = "t2.nano"
    us-west-1 = "t2.large"
  }
}

variable "instance_type_list" {
  type = list
  default = ["t2.micro", "t2.nano", "t2.large"]
}

variable "is_required" {}