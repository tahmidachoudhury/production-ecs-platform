resource "aws_secretsmanager_secret" "database_url" {
  name = "${var.project_name}-${var.environment}-database-url"

  tags = {
    Name        = "${var.project_name}-rds-db-secret"
    Environment = var.environment
  }
}
