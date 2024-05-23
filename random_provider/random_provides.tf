resource "random_id" "my_id" {
 byte_length = 6
}

output "my_id" {
 value = random_id.my_id.hex
#random_id.my_id.hex is used to access the generated random ID in hexadecimal format.
}

output "my_id_base64" {
 value = random_id.my_id.b64_std
}



output "my_id_decimal" {
  value = random_id.my_id.dec
}

#output "my_id_base64" {
#  value = random_id.my_id.b64
#}
#output "my_id_base64url" {
#  value = random_id.my_id.b64_url
#}
#output "my_id_uuid" {
#  value = random_id.my_id.uuid
#}

