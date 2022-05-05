resource "aws_instance" "local-exec" {
  ami           = "ami-0f9fc25dd2506cf6d"
  instance_type = "t2.micro"
  key_name = "terraform-key"

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

  tags = {
    Name = "local-exec"
  }
}