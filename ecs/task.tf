resource "aws_ecs_task_definition" "v1cs-ecs-task-mariogame" {
  family                   = "service"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_tasks_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  cpu                      = 2048
  memory                   = 4096
  tags = {
    Name = "${var.prefix}-ecs-task-mariogame"
  }
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "mariogame",
      "image"     : "${var.image_uri}",
      "cpu"       : 512,
      "memory"    : 2048,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 8080,
          "hostPort"      : 8080
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "v1cs-ecs-service-mariogame" {
  name             = "mariogame-service"
  cluster          = aws_ecs_cluster.v1cs-ecs-cluster.id
  task_definition  = aws_ecs_task_definition.v1cs-ecs-task-mariogame.id
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "LATEST"
  tags = {
    Name = "${var.prefix}-ecs-service-mariogame"
  }

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.v1cs-ecs-sg-mariogame.id]
    subnets          = [aws_subnet.v1cs-ecs-subnet.id]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
  
}