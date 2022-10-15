variable "app" {
  type        = string
  description = "The name of the application or project that the stack supports"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "The target environment for the stack - could be a tier or account level reference"
  sensitive   = false
}

variable "force_detach_policies" {
  type        = string
  description = ""
  default     = false
  sensitive   = false
}

variable "program" {
  type        = string
  description = "The name of the program that the application or project belongs to"
  sensitive   = false
}

variable "iam_prefix" {
  type        = string
  description = "A string prefix for all IAM resources created with the module"
  default     = null
  sensitive   = false
}

variable "s3_buckets" {
  type        = set(string)
  description = "Set of S3 Bucket ARNs to allow Glue to access"
  sensitive   = false
}