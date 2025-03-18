resource "aws_instance" "practice" {
  ami             = "ami-023a307f3d27ea427"
  instance_type   = "t2.micro"
  key_name        = "terraform-key"
  security_groups = [aws_security_group.sg.name]
  user_data       = file("${path.module}/user_data.sh")

}