# rds resource
# secrets resource

# resource "aws_rds_cluster" "postgresql" {
#   cluster_identifier      = "${var.project_name}-psql-cluster"
#   engine                  = "postgres"
#   engine_version = 
#   availability_zones      = ["eu-west-2a"]
#   database_name           = "mydb"
#   master_username         = "foo"
#   master_password         = "must_be_eight_characters"
#   backup_retention_period = 5
#   preferred_backup_window = "07:00-09:00"
# }

resource "aws_db_instance" "psql" {
  allocated_storage    = var.storage_size
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance
  db_name              = "mydb"
  username             = "foo"
  parameter_group_name = "${var.project_name}-psql-${var.engine_version}"
  skip_final_snapshot  = true
}
