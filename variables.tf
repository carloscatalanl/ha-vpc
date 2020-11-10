variable "region" {
  description = "Region on AWS to Deploy"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
}

variable "public_subnet_cidrs" {
  description = "CIDRs for the PUBLIC subnets"
}

variable "private_subnet_cidrs" {
  description = "CIDRs for the PRIVATE subnets"
}

variable "public_sg_ingress" {
  description = "public_subnet INGRESS rules"
}

variable "public_sg_egress" {
  description = "public_subnet EGRESS rules"
}

variable "private_sg_ingress" {
  description = "private_subnet INGRESS rules"
}

variable "private_sg_egress" {
  description = "private_subnet EGRESS rules"
}

variable "instance_type" {
  description = "Instance type for EC2"
}