#  variable "sample" {
 # default = "Hellow world"
#}

#output "sample" {
 # value = var.sample
#}

#variable "sample1"{}

#output "sample1" {
#  value = var.sample1
#}

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