# ECS Cluster
resource "aws_ecs_cluster" "cluster" {
  name = "web-ecs-cluster-${var.app_name}-${var.stage}"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
