output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "aws_public_subnet_id" {
  description = "The ID of the AWS Public Subnet"
  value       = aws_subnet.public.id
}
