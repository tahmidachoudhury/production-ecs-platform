output "database_url_secret_arn" {
  description = "This is the DB secret that the ECS app will use."
  value       = aws_secretsmanager_secret.database_url.arn
  sensitive   = true
}
