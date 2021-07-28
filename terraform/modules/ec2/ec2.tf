resource "aws_instance" "sample" {
  ami           = "ami-074df373d6bafa625"
  vpc_security_group_ids = var.sg_id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

variable "sg_id" {}