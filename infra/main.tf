module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
  environment  = var.environment
}

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

module "cloudwatch" {
  source       = "./modules/cloudwatch"
  project_name = var.project_name
  environment  = var.environment
}

module "rds" {
  source             = "./modules/rds"
  project_name       = var.project_name
  environment        = var.environment
  engine             = "postgres"
  engine_version     = "18.3"
  instance           = "db.t3.micro"
  storage_size       = 20
  storage_type       = "gp2"
  private_subnet_ids = module.networking.private_subnet_ids
  rds_sg_id          = module.security_groups.rds_sg_id
}

module "ecs" {
  source                    = "./modules/ecs"
  project_name              = var.project_name
  environment               = var.environment
  aws_region                = var.aws_region
  ecs_sg_id                 = module.security_groups.ecs_sg_id
  private_subnet_ids        = module.networking.private_subnet_ids
  container_name            = local.container_name
  container_image           = var.container_image
  alb_target_group_arn      = module.alb.target_group_arn
  task_role_arn             = module.iam.ecs_task_role_arn
  execution_role_arn        = module.iam.execution_role_arn
  cloudwatch_log_group_name = module.cloudwatch.log_group_name
  cpu                       = 256
  memory                    = 512
  container_port            = 3000
  number_of_tasks           = 1
  db_secret_arn             = module.rds.db_secret_arn
  depends_on                = [module.rds]
}
