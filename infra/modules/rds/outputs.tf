output "address" {
  value       = aws_db_instance.psql.address
  description = " The hostname of the RDS instance."
}

output "port" {
  value       = aws_db_instance.psql.port
  description = "The database port."
}

output "endpoint" {
  value       = aws_db_instance.psql.endpoint
  description = "The DB connection endpoint in `address:port` format."
}

output "master_user_secret_arn" {
  value       = aws_db_instance.psql.master_user_secret[0].secret_arn
  description = "ARN of the Secrets Manager secret containing RDS master credentials."
  sensitive   = true
}

output "db_name" {
  value       = aws_db_instance.psql.db_name
  description = "The name of the default database."
}
