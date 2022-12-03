#convert strings to lower case and extract a substring

variable "substring" {
  default = "SOME are CAPS"
}

output "lowercase" {
   value = "${lower(var.substring)}"
}
output "substr" {
  value = "${substr(var.substring, 5, 3)}"
}