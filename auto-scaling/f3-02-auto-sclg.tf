resource "aws_autoscaling_group" "asg" {
  name                = "my-auto-scaling-group"
  desired_capacity    = 2
  min_size            = 1
  max_size            = 3
  vpc_zone_identifier = ["subnet-07245def94cd89368", "subnet-08dd375488d722612"]
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.tg.arn]

  health_check_type         = "EC2"
  health_check_grace_period = 300
}
