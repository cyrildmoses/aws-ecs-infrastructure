# Security Group for ECS
resource "aws_security_group" "ecs_sg" {
  vpc_id      = var.vpc_id
  name        = "ecs-container-from-alb-${var.app_name}-${var.stage}"
  description = "Inboud traffic from Internet_Facing_ALB"

  ingress {
    from_port       = var.ecs_task_port
    to_port         = var.ecs_task_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    description = "Allows all outbound traffic to all IP addresses on all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    used_by     = "private_ecs"
  }
}

# Security Group for ALB
resource "aws_security_group" "alb_sg" {
  name        = "internet-facing-alb-${var.app_name}-${var.stage}"
  description = "Allow inbound traffic from any where on Port 80"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allows inbound HTTP traffic on port 80 from any source IP address"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allows all outbound traffic to all IP addresses on all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    used_by     = "public_alb"
  }
}
