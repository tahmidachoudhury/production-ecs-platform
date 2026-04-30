module "networking" {
  source       = "./modules/networking"
  project_name = var.project_name
  environment  = var.environment
}

module "security_groups" {
  source       = "./modules/security_groups"
  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.networking.vpc_id
}

module "alb" {
  source         = "./modules/alb"
  project_name   = var.project_name
  environment    = var.environment
  alb_sg_id      = module.security_groups.alb_sg_id
  public_subnets = module.networking.public_subnets
}
