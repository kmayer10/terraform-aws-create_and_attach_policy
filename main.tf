resource "aws_iam_policy" "aws_iam_policy" {
  count       = var.accessNeeded == false ? 0 : 1
  name        = var.policyName
  path        = "/"
  description = var.description
  policy      = file("./policies/${var.policy}.json")
}
resource "aws_iam_policy_attachment" "aws_iam_policy_attachment" {
  count      = var.accessNeeded == false ? 0 : 1
  policy_arn = aws_iam_policy.aws_iam_policy[0].arn
  users      = var.users
  name       = aws_iam_policy.aws_iam_policy[0].name
}
