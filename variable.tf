# Define variable for the Virtual private cloud
variable "cidr_for_vpc" {
  description = "cidr range for vpc"
  type        = string
}

variable "tenancy" {
  description = "Instance tenancy for instances launced in this vpc"
  type        = string
  default     = "default"
}

variable "dns_hostnames_enabled" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = false
}

variable "dns_support_enabled" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "vpc_name" {
  type        = string
  description = "Name for the vpc"
}
# Define variable for the web server
variable "web_server_name" {
  description = "name for the instance created as web server"
  type        = string
}

variable "instance_types" {
  description = "instance type for the instance created as web server"
  type        = string
}

variable "key_name" {
  description = "keypair for the instance created as web server"
  type        = string
}

variable "images" {
  description = "images for the instance created as web server"
  type        = string
}

# Define variable for the Web server security group ingress rule
variable "inbound_rules_web" {
  type = list(object({
    port        = number
    description = string
    protocol    = string
  }))
  description = "ingress rule for security group of web server"
  default = [{
    description = "inbound rule for webserver  for ssh"
    port        = 22
    protocol    = "tcp"
    },
    {
      description = "inbound rule for webserver  for http"
      port        = 80
      protocol    = "tcp"
  }]
}

