
resource "aws_instance" "alb_instance" {
  ami           = "ami-023a307f3d27ea427" # Ubuntu AMI for ap-south-1
  instance_type = "t2.micro"
  key_name      = "terraform-key"

  security_groups = [aws_security_group.ec2_sg.name]

  user_data = file("user_data.sh")

  tags = {
    Name = "alb-instance"
  }
}


