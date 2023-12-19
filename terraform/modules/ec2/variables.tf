variable "instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key name to use for the EC2 instance"
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in"
}

variable "security_group_id" {
  description = "The security group ID to associate with the EC2 instance"
}
