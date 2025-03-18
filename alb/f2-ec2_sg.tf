resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Allow traffic only from ALB"
  vpc_id      = "vpc-0017c992cd0b99332" # Replace with your actual VPC ID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH access (you can restrict this)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
}
