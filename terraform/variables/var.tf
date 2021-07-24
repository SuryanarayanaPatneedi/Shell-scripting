variable "sample" {
  default = "Suryanarayana"
}

output "sample" {
  value = var.sample
}
variable "sample2" {
  default = "Narayana"
}

output "sample2" {
  value = var.sample2
}

variable "number" {
  default = 100
}

output "printingnumber" {
  value = var.number
}
variable "boolean" {
  default = true
}

output "declareboolean" {
  value =var.boolean
}


variable "list" {
  default = [
    "Hellow",
    100,
    true
  ]
}

output "listdeclare" {
  value = var.list
}















