variable "website_url" {
  type    = string
  default = "http://{your_domain}"
}

variable "website_admin_url" {
  type    = string
  default = "http://admin.{your_domain}"
}

variable "region" {
  type    = string
  default = "eu-west-3"
}

variable "vpc_cidr" {
  type = string
}

variable "name" {
  type = string
}

variable "env" {
  type = string
}

variable "public_subnets_cidr" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "private_subnets_cidr" {
  type = list(string)
}
