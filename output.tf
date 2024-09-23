# Output ECS Task Role ARN
output "ecs_task_role_rn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}


# Output ALB security group id
output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

# Output ECS cluster Id
output "redis_alb_url" {
  value = aws_ecs_cluster.cluster.id
}

