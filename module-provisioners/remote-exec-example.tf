/*
resource "aws_instance" "remote-exec" {
  ami           = "ami-0f9fc25dd2506cf6d"
  instance_type = "t3.micro"
  key_name = "terraform-key"

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./terraform-key.pem")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"

    ]
  }
  tags = {
    Name = "remote-exec"
  }
}*/
