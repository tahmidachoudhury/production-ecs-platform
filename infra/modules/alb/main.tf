resource "aws_lb" "ecs_alb" {
  name                       = "${var.project_name}-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.alb_sg_id]
  subnets                    = var.public_subnets
  drop_invalid_header_fields = true
  tags = {
    Name        = var.project_name
    Environment = var.environment
  }
}
