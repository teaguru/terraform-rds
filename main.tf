resource "aws_db_parameter_group" "rds_postgres_pg" {
    name        = var.parameter_group_name
    family      = "postgres9.6"
    description = "RDS default parameter group"
}

resource "aws_db_instance" "rds_postgres" {
    name                    = var.postgres_name

    identifier_prefix       = var.identifier_prefix
    allocated_storage       = var.allocated_storage
    max_allocated_storage   = var.max_allocated_storage
    storage_type            = var.storage_type
    storage_encrypted       = true

    engine                  = "postgres"
    engine_version          = "9.6"
    instance_class          = var.instance_class

    username                = var.username
    password                = var.password

    db_subnet_group_name    = var.subnet_name
    multi_az                = true
    publicly_accessible     = false
    vpc_security_group_ids  = var.vpc_security_group_ids
    parameter_group_name    = aws_db_parameter_group.rds_postgres_pg.name

    maintenance_window      = var.maintenance_window
    backup_window           = var.backup_window
    backup_retention_period = var.backup_retention_period
    skip_final_snapshot     = var.skip_final_snapshot

    apply_immediately       = var.apply_immediately

    copy_tags_to_snapshot   = var.copy_tags_to_snapshot
    tags = merge(
        {"Name": var.postgres_name},
        var.additional_tags,
    )

    lifecycle {
      ignore_changes = [password]
    }
}
