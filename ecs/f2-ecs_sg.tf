resource "aws_security_group" "ecs_sg" {
  name        = "ecs-security-group"
  description = "Allow inbound traffic for ECS tasks"
  vpc_id      = "vpc-0017c992cd0b99332" # Replace with your actual VPC ID

  # Allow inbound HTTP traffic from the ALB
  ingress {
    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"
  }

  # Allow outbound traffic to anywhere (required for pulling images, updates, etc.)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecs-sg"
  }
}
