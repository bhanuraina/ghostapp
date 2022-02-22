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

variable "ec2_instance_type" {
default = "t3.micro"
}

variable "mysql_password" {
default = "Ghost#1234"
}
