variable "region" {
  description = "Region on AWS to Deploy"
}

variable "public_subnets" {
  description = "List of PUBLICS subnets"
}

variable "private_subnets" {
  description = "List of PRIVATES subnets"
}

variable "vpc_main_id" {
  description = "Main VPC ID"
}

variable "public_sg_ingress" {
  description = "Ingress Rules to public_subnet"
}

variable "public_sg_egress" {
  description = "Egress Rules to public_subnet"
}

variable "private_sg_ingress" {
  description = "Ingress Rules to private_subnet"
}

variable "private_sg_egress" {
  description = "Egress Rules to public_subnet"
}