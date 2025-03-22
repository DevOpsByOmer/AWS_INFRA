resource "aws_ecs_service" "my_service" {
  name            = "my-ecs-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task.arn
  launch_type     = "FARGATE"

  desired_count = 2 # Number of tasks to run

  network_configuration {
    subnets          = ["subnet-07245def94cd89368", "subnet-08dd375488d722612"] # Replace with your actual subnets
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = "my-container" # Replace with the name from your task definition
    container_port   = 3000           # Your application's container port
  }

  depends_on = [aws_lb_listener.ecs_listener]
}


