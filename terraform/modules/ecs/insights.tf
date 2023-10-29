resource "aws_iam_role_policy_attachment" "ecs_execution_role_cloudwatch_attachment" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}


