resource "aws_instance" "ec2-terraform" {
  ami = "ami-0f9fc25dd2506cf6d"
  instance_type = var.instance_type_list[0]
  tags = {
    Name = "ec2-terraform"
  }
  count = var.is_required == 1 ? 0 : 1
}

resource "aws_instance" "ec2-terraform-2" {
  ami = "ami-0f9fc25dd2506cf6d"
  instance_type = var.instance_type_list[1]
  tags = {
    Name = "ec2-terraform"
  }
  count = var.is_required == 1 ? 1 : 0
}

resource "aws_eip" "elastic-ip-terraform" {
  vpc = "true"
  tags = {
    Name = "elastic-ip-terraform"
  }
}

/*resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2-terraform.id[0]
  allocation_id = aws_eip.elastic-ip-terraform.id
}*/

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.elastic-ip-terraform.public_ip}/32"]
  }

  tags = {
    Name = "allow_tls"
  }
}