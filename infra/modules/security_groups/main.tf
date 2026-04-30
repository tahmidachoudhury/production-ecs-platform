resource "aws_security_group" "alb" {
  name        = "${var.project_name}-alb-sg"
  description = "Allow HTTP and HTTPS inbound traffic and all outbound traffic on ALB"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-alb-sg"
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_443" {
  security_group_id = aws_security_group.alb.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "alb_80" {
  security_group_id = aws_security_group.alb.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "alb_out" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# ---------------------------------------------------------------------
resource "aws_security_group" "ecs_tasks" {
  name        = "${var.project_name}-ecs-sg"
  description = "Allow TCP inbound traffic on port 3000 for the ECS container"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-ecs-sg"
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecs_in" {
  security_group_id            = aws_security_group.ecs_tasks.id
  from_port                    = 3000
  to_port                      = 3000
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.alb.id
}

resource "aws_vpc_security_group_egress_rule" "ecs_out" {
  security_group_id = aws_security_group.ecs_tasks.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# ---------------------------------------------------------------------
resource "aws_security_group" "rds_psql" {
  name        = "${var.project_name}-rds-sg"
  description = "Allow TCP inbound traffic on port 5432 for the PostgreSQL server"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-rds-sg"
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "rds_in" {
  security_group_id            = aws_security_group.rds_psql.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.ecs_tasks.id
}

resource "aws_vpc_security_group_egress_rule" "rds_out" {
  security_group_id = aws_security_group.rds_psql.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
