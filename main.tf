provider "aws" {
  region = var.region
}

module "vpc" {
  source               = "./modules/vpc"
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "network" {
  source = "./modules/network"
  region = var.region
  vpc_main_id     = module.vpc.vpc_main_id
  public_subnets  = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
}

module "instances" {
  source = "./modules/instances"
  region = var.region
  vpc_main_id     = module.vpc.vpc_main_id
  public_subnets  = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets


  public_sg_ingress  = var.public_sg_ingress
  public_sg_egress   = var.public_sg_egress
  private_sg_ingress = var.private_sg_ingress
  private_sg_egress  = var.private_sg_egress
}