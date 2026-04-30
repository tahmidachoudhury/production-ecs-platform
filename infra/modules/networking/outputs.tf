output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnets" {
  description = "The public subnets in the VPC"
  value       = aws_subnet.public[*].id
}
