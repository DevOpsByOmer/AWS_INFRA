resource "aws_lb" "ecs_alb" {
  name               = "ecs-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = ["subnet-07245def94cd89368", "subnet-08dd375488d722612"]
}

resource "aws_lb_target_group" "ecs_tg" {
  name        = "ecs-tg"
  port        = 3000 # Your container port
  protocol    = "HTTP"
  vpc_id      = "vpc-0017c992cd0b99332"
  target_type = "ip" # Required for ECS
}

resource "aws_lb_listener" "ecs_listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }
}
