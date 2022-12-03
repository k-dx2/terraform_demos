
variable "mylist" {
    type =list
    default = ["myrg123","myrg456","myrg"]
  
}

output "op1" {
    value = [for i in var.mylist:upper(i)]

}

output "op2" {
    value = [for i in var.mylist : upper(i) if length(i) > 6]
}