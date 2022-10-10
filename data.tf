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

data "aws_iam_policy_document" "main" {

  statement {
    sid = "ListBucket"
    actions = [
      "s3:GetBucketLocation",
      "s3:GetBucketRequestPayment",
      "s3:GetEncryptionConfiguration",
      "s3:ListBucket",
    ]
    effect    = length(var.buckets) > 0 ? "Allow" : "Deny"
    resources = length(var.buckets) > 0 ? var.buckets : ["*"]
  }

  statement {
    sid = "GetObject"
    actions = [
      "s3:GetObject",
    ]
    effect    = length(var.buckets) > 0 ? "Allow" : "Deny"
    resources = length(var.buckets) > 0 ? formatlist("%s/*", var.buckets) : ["*"]
  }

  statement {
    sid = "Decrypt"
    actions = [
      "kms:Decrypt",
    ]
    effect    = length(var.keys) > 0 ? "Allow" : "Deny"
    resources = length(var.keys) > 0 ? var.keys : ["*"]
  }
}