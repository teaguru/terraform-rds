variable "vpc_id" {
  type        = string
  description = "VPC ID of network."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of at least 2 subnets in different AZs for DB subnet group"
}

variable "spark_service_access_sg_ids" {
  type        = list(string)
  description = "List of Spark service access security group IDs to allow ingress from"
}

variable "tamr_vm_sg_id" {
  type        = string
  description = "Security group ID of Tamr VM to allow ingress from"
}
