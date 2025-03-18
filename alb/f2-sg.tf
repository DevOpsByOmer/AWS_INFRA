resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow HTTP and ALB traffic"

  # Allow incoming HTTP traffic to ALB
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
