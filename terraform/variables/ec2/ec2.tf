
resource "aws_instance" "sample" {
  ami           = "ami-074df373d6bafa625"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}






resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow_ssh"


  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}



provider "aws" {
  region = "us-east-1"
}

output "publicip" {
  value = aws_instance.sample.public_ip
}