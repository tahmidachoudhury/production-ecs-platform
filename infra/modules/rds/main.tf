resource "aws_db_subnet_group" "private" {
  name       = "${var.project_name}-rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.project_name}-rds-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "psql" {
  allocated_storage           = var.storage_size
  storage_type                = var.storage_type
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance
  db_subnet_group_name        = aws_db_subnet_group.private.name
  db_name                     = "mydb"
  username                    = "postgres"
  manage_master_user_password = true
  skip_final_snapshot         = true
  vpc_security_group_ids      = [var.rds_sg_id]

  tags = {
    Name        = "${var.project_name}-rds-db"
    Environment = var.environment
  }
}
