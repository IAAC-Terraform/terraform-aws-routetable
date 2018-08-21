variable "vpc_id" {}
variable "name" {}
variable "env" {}
variable "create_vpc" {}
variable "subnets" {
  type = "list"
}
variable "type" {
  default = ""
}

variable "subnet_id" {
  type = "list"
}