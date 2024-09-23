# Variables

variable "app_name" {
  type        = string
  description = "Applciation Name"
  default     = "demo"
}

variable "region" {
  type        = string
  description = "AWS Region Name"
  default     = "us-west-1"
}

variable "stage" {
  type        = string
  description = "Application Stage enviroment name"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to use"
}

variable "ecs_task_port" {
  type        = number
  default     = 8000
  description = "Port where the ECS application listens"
}



