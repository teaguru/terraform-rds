variable "postgres_db_name" {
  type = string
  description = "Name of the postgres db"
}

variable "parameter_group_name" {
  type = string
  description = "Name of the parameter group"
}

variable "identifier_prefix" {
  type = string
  description = "Identifier prefix for the resources"
}

variable "pg_username" {
  type = string
  description = "Username for postgres"
}

variable "pg_password" {
  type = string
  description = "Password for postgres"
}


