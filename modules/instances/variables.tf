variable "public-subnets" {
  description = "List of public subnet IDs"
}

variable "private-subnets" {
  description = "List of private subnet IDs"
}
variable "public-security-group" {
  description = "ID of the public security group"
}

variable "private-security-group" {
  description = "ID of the private security group"
}
variable "alb_dns_name" {}