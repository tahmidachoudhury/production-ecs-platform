resource "aws_secretsmanager_secret" "db_password" {
  name = "${var.project_name}-${var.environment}-database-password"

  tags = {
    Name        = "${var.project_name}-rds-db-password"
    Environment = var.environment
  }
}
