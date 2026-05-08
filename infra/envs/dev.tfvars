environment = "dev"

container_image = "851725183654.dkr.ecr.eu-west-2.amazonaws.com/umami-ecs-app-dev:v1"

subdomain_name = "analytics.tahmidchoudhury.uk"

domain_name = "tahmidchoudhury.uk"

aws_region = "eu-west-2"

# rds

engine         = "postgres"
engine_version = "18.3"
instance       = "db.t3.micro"
storage_size   = 20
storage_type   = "gp2"

# ecs

cpu             = 256
memory          = 512
container_port  = 3000
number_of_tasks = 1