locals {
  effective_tags = length(var.tags) > 0 ? var.tags : var.additional_tags
}

resource "aws_db_parameter_group" "rds_postgres_pg" {
  name        = var.parameter_group_name
  family      = var.parameter_group_family
  description = "TAMR RDS parameter group"
  tags        = local.effective_tags
}

resource "aws_db_subnet_group" "rds_postgres_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = var.rds_subnet_ids
  tags       = local.effective_tags
}

resource "aws_db_instance" "rds_postgres" {
  name = var.postgres_name

  #@Sidentifier_prefix     = var.identifier_prefixter
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = var.storage_type
  storage_encrypted     = true

  engine                     = "postgres"
  engine_version             = var.engine_version
  instance_class             = var.instance_class
  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  username = var.username
  password = var.password
  port     = var.db_port

  db_subnet_group_name   = aws_db_subnet_group.rds_postgres_subnet_group.name
  multi_az               = true
  publicly_accessible    = false
  vpc_security_group_ids = var.security_group_ids
  parameter_group_name   = aws_db_parameter_group.rds_postgres_pg.name

  maintenance_window      = var.maintenance_window
  backup_window           = var.backup_window
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = var.skip_final_snapshot

  apply_immediately = var.apply_immediately

  copy_tags_to_snapshot = var.copy_tags_to_snapshot
  tags                  = local.effective_tags

  lifecycle {
    ignore_changes = [password]
  }
}
