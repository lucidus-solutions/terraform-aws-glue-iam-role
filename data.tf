data "aws_partition" "current" {}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = [
        "glue.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "this" {

  statement {
    sid = "glueListBucket"
    actions = [
      "s3:GetBucketLocation",
      "s3:GetEncryptionConfiguration",
      "s3:ListBucket",
    ]
    effect    = "Allow"
    resources = var.s3_buckets
  }

  statement {
    sid = "glueGetObject"
    actions = [
      "s3:GetObject",
    ]
    effect    = "Allow"
    resources = formatlist("%s/*", var.s3_buckets)
  }
}