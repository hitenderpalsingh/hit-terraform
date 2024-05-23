locals {
 
	last_name = "singh"
	greetings = "Hello ${var.first_name} ${local.last_name} Your age is ${var.age}"
}

output "name"{
	value = "${var.first_name} ${local.last_name}"
}

#output "name_age" {
#	value = "${var.first_name} ${local.last_name}: ${var.age}"
#}

output "name_age" {
	value = local.greetings
}
#Using inbuilt function
output "name_with_format" {
	value = format("%s, %s ,%s", var.first_name, local.last_name, var.age )
#	text = format ("%s %s: %s", var.first_name, local.last_name, var.age )
}

