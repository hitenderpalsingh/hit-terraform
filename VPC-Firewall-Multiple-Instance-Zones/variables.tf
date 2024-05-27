variable "project" {
  type    = string
  default = "linen-setting-415312"
}
variable "region" {
  type    = string
  default = "asia-south2"
}
variable "zone" {
  default = "asia-south2-a"
}
variable "bucket_name" {
  default = "hite-dev-test"
}
variable "bucket_location" {
  default = "us"
}
#variable "vm_instance_name" {
#	type = list(string)
#	default = ["server1","server2"]
#	type = string
#	default = "server"
#}

#####################################
#VM variables

variable "vm_instance_name" {
  type    = string
  default = "n1-standard-1"
}

#variable "vm_zone" {
#  type    = string
# type    = list(string)
# default = ["asia-south2-a", "asia-south2-b", "aisa-south2-c"]
#   default = "aisa-south2-a"
#}
variable "vm_zone" {
  type    = string
  default = "asia-south2-a"
}
variable "vm_machine_type" {
  type    = string
  default = "e2-micro"
}

variable "vm_instance_count" {
  description = "Number of VM instances to create"
  type        = number
  default     = 2
}

variable "vm_instance_names" {
  description = "List of VM instances names"
  type        = list(string)
  default     = ["instance-1", "instance-2", "instance-3"]
}

variable "zone_mappings" {
  type = map(string)
  default = {
    "instance-1" = "asia-south2-a"
    "instance-2" = "asia-south2-b"
    "instance-3" = "asia-south2-c"
  }
}

#######################################
#Network

#variable "vpc_network" {
#       type = string
#       default = "my_network"
#}
variable "vpc_network" {
  type    = string
  default = "my-network" # Adjust this value as needed
}

variable "nw_region" {
  type    = string
  default = "asia-south2"
}

variable "nw_subnetwork" {
  type    = string
  default = "asia-south2-a"
}

variable "vpc_subnet1" {
  type    = string
  default = "asia-south1"
}

variable "vpc_subnet2" {
  type    = string
  default = "asia-south2"

}
