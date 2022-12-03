variable "list_to_iterate" {
    description = "A list to iterate on"
    type = list(string)
    default = []
}

resource "resource" "local_given_name" {
    dynamic "block" {
    for_each = var.list_to_iterate
        content {
        block_arg = local_given_name.value
        }
    } 
}