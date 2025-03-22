resource "aws_ecr_repository" "ecs_repo" {
  name                 = "ecs-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
