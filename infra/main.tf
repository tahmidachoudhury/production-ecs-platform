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
  public_subnets = module.networking.public_subnet_ids
  vpc_id         = module.networking.vpc_id
}

module "ecs" {
  source                    = "./modules/ecs"
  project_name              = var.project_name
  environment               = var.environment
  aws_region                = var.aws_region
  ecs_sg_id                 = module.security_groups.ecs_sg_id
  private_subnet_ids        = module.networking.private_subnets_ids
  container_name            = local.container_name
  container_image           = var.container_image
  alb_target_group_arn      = module.alb.target_group_arn
  task_role_arn             = module.iam
  execution_role_arn        = module.iam
  cloudwatch_log_group_name = module.cloudwatch
  cpu                       = 256
  memory                    = 512
  container_port            = 3000
  desired_count             = 1
  db_secret                 = ""
}

module "rds" {
  source         = "./modules/rds"
  project_name   = var.project_name
  environment    = var.environment
  engine         = "postgres"
  engine_version = "18.3"
  instance       = "db.t3.micro"
  storage_size   = 20
  storage_type   = "gp2"
}
