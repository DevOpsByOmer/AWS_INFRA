resource "aws_launch_template" "lt" {
  name          = "ec2-launch-template-1"
  image_id      = "ami-023a307f3d27ea427"
  instance_type = "t2.micro"
  key_name      = "terraform-key"

  user_data = base64encode(file("user_data.sh")) # Base64 encode the script

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.ec2_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "AutoScaling-Instance"
    }
  }
}
