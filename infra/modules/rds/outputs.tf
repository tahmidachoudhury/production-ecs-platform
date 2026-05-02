output "rds_db_password" {
  description = "value"
  value       = aws_db_instance.psql.master_user_secret[0].secret_arn
  sensitive   = true
}
