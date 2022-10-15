resource "aws_iam_role" "this" {
  name                  = "${local.iam_stack}-glue-iam-role"
  description           = "A role that the Glue service can assume to perform actions in support of the ${var.app} project"
  assume_role_policy    = data.aws_iam_policy_document.assume_role.json
  force_detach_policies = var.force_detach_policies
}

resource "aws_iam_policy" "this" {
  name        = "${local.iam_stack}-glue-iam-role"
  description = "Policy associated with the AWS Glue role in support of the ${var.app} project"
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_iam_role_policy_attachment" "aws_glue_service_role" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/service-role/AWSGlueServiceRole"
}
