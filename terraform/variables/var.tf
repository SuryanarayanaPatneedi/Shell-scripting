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