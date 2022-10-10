locals {
  stack     = "${var.program}-${var.env}-${var.app}"
  iam_stack = var.iam_prefix == null ? "${local.stack}" : "${var.iam_prefix}-${local.stack}"
}