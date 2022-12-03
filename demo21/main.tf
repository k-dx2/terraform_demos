variable "var2" {
    type = map
    default = {
     "k1" = "trg1" 
     "k2" = "trg2" 
     "k3" = "trg3"
     }
}

output "map_for_example" {
    value = [for i, x in var.var2 : "${i} value is ${x}"]
}