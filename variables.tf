variable "name" {
  default     = ""
  type        = string
  description = "The name of the Session Manager."
}

variable "iam_policy" {
  default     = ""
  type        = string
  description = "The policy document. This is a JSON formatted string."
}

variable "iam_path" {
  default     = "/"
  type        = string
  description = "Path in which to create the IAM Role and the IAM Policy."
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}
