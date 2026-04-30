resource "aws_lb" "umami-app" {
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

resource "aws_lb_target_group" "umami-app" {
  name        = "${var.project_name}-alb-tg"
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path     = "/api/heartbeat"
    port     = 3000
    protocol = "HTTP"
  }
}
