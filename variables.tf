variable "name" {
  description = "Prefix for resource names"
  type        = string
  default     = "sec-baseline"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "min_password_length" {
  description = "Minimum IAM password length"
  type        = number
  default     = 14
}
