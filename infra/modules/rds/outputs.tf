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

output "db_secret" {
  value       = aws_db_instance.psql.password
  description = "Password for the master DB user."
}
