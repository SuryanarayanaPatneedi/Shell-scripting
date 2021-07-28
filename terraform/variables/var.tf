variable "sample" {
  default = "Hellow world"
}

output "sample" {
  value = var.sample
}

variable "sample2"{}

output "sample2" {
  value = var.sample2
}

output "sample2" {
  value = "Hellow"
}

variable "sample3" {
  value = 100
}

variable "sample4" {
  value= true
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