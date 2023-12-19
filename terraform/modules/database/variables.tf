
# variables.tf
variable "db_username" {
  description = "Username for the database"
  default     = "admin"
}

variable "subnet_id" {
  description = "Subnet ID for the database"
}

variable "security_group_id" {
  description = "Security group ID for the database"
}
