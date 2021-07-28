variable "sample" {
  default = "Hellow world"
}
output "sample" {
  value = var.sample
}

variable "sample1"{}

output "sample1" {
  value = var.sample1
}

variable "sample2" {
  default= "Hellow"
}

variable "sample3" {
  default= 100
}

variable "sample4" {
  default= true
}


output "sample2" {
  value = var.sample2
}

output "sample3" {
  value = var.sample3
}

output "sample4" {
  value = var.sample4
}

output "data-types" {
  value = "string= ${var.sample2} ,  number =${var.sample3} , boolen =${var.sample4}"
}


variable "training" {
  default =["AWS","DEVOPS"]
}

variable "trainings" {
  default = {
    aws= "6Am IST"
    devops="10am ist"
  }
}
output "training" {
  value = var.training
}

output "trainings" {
  value = var.trainings
}
output "trainingss" {
  value = var.training[0]
}

output "trainingss" {
  value = var.training[1]
}

output "samething" {
  value = var.trainings[aws]
}