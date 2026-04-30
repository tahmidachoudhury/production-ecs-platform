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
