resource "aws_lb" "practice_alb" {
  name               = "practice-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = ["subnet-07245def94cd89368", "subnet-08dd375488d722612"] # Replace with your public subnets
}

resource "aws_lb_target_group" "practice_tg" {
  name     = "practice-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0017c992cd0b99332" # Replace with your VPC ID
}

resource "aws_lb_target_group_attachment" "practice_attachment" {
  target_group_arn = aws_lb_target_group.practice_tg.arn
  target_id        = aws_instance.alb_instance.id
  port             = 80
}

resource "aws_lb_listener" "practice_listener" {
  load_balancer_arn = aws_lb.practice_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.practice_tg.arn
  }
}
resource "aws_security_group_rule" "alb_to_ec2" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ec2_sg.id # Apply rule to EC2 SG
  source_security_group_id = aws_security_group.alb_sg.id # Allow traffic from ALB SG
}
