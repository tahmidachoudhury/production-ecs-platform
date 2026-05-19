output "repository_url" {
  description = "The URL of the ECR Repository"
  value       = aws_ecr_repository.repo.repository_url
}
