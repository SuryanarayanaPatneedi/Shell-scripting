module "sg"{
  source="./sg"
}
module "ec2"{
  source="./ec2"
  depends_on = [module.sg]
  SG_ID=module.sg.SG_ID

}


provider "aws" {
  region="us-east-1"
}
