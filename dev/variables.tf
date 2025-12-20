variable "ami_id" {
  type        = string
  description = "ami of current instance"
}

variable "key_name" {
  type        = string
  description = "KMS key used on instances"
}

variable "subnet_id1" {
  type        = string
  description = "primary subnet used on instances"
}

variable "subnet_id2" {
  type        = string
  description = "secondary subnet used on instances"
}

variable "subnet_id3" {
  type        = string
  description = "tertiary subnet used on instances"
}

locals {
  tags_all = {
    Environment = "test"
    Owner       = "John"
    ManagedBy   = "Terraform"
  }
}
