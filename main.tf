resource "aws_cloudwatch_event_rule" "cron_midnight" {
  name                = "run_at_midnight"
  description         = "Schedule trigger for run every day at midnight"
  schedule_expression = "cron(*/1 * * * *)"
  is_enabled          = true
}

module "nameApp" {
  source = "./tfecs"

  app = "nameApp"

  # Common inputs
  execution_role_arn = aws_iam_role.ecs_exec.arn
  task_role_arn      = aws_iam_role.ecs_task.arn
  repo_url           = "${aws_ecr_repository.yourRepo.repository_url}:latest"
  secret_name        = "Name secret"
  secret_value_arn   = data.aws_secretsmanager_secret_version.yourSecret.arn
  ecs_cluster        = aws_ecs_cluster.nameCluster.arn
  ecs_event_role     = aws_iam_role.roleEvents.arn
  security_groups    = [aws_security_group.yourSg.id]
  subnets            = [ list of subnets ]
  lambda_stream_arn  = "arn lambda to stream logs"
  event_rule         = aws_cloudwatch_event_rule.cron_midnight.name
}
