variable "vpc_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "iam_instance_profile" {
  type = string
}

variable "tags" {
  type = map(string)
}
