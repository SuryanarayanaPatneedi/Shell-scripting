module "sg"{
  source="./sg"
}
module "ec2" {
  source = "./ec2"
  sg_id = module.sg.sg_id
}

provider "aws" {
  region = "us-east-1"
}

output "privateip" {
  value = module.ec2.privateip
}