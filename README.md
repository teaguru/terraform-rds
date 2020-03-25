# Tamr AWS RDS Terraform Module
This terraform module creates an AWS RDS postgres instance.
This repo follows the [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure).

# Examples
## Basic
Inline example implementation of the module.  This is the most basic example of what it would look like to use this module.
```
module "rds_postgres" {
    source = "git::https://github.com/Datatamer/terraform-rds-postgres?ref=0.1.0"
    postgres_name = "tamr_rds_db"
    parameter_group_name = "tamr-rds-postgres-pg"
    identifier_prefix = "tamr-rds-"

    username = "tamr"
    password = "8characterpassword"

    subnet_name = "rds_private"
    vpc_security_group_ids = []
}
```

# Resources Created
This terraform module will create:
* an AWS RDS Postgres instance
* database parameter group

# Variables
## Inputs
* `vpc_security_group_ids` (required): List of VPC security groups to associate
* `password` (required): The postgres password
* `username` (optional): The postgres username
* `postgres_name` (optional): The name of the postgres instance
* `parameter_group_name` (optional): The name of the rds parameter group
* `identifier_prefix` (optional): Identifier prefix for the RDS instance
* `subnet_name` (optional): The name of the subnet to add the RDS instance to
* `allocated_storage` (optional): Allocate storage
* `max_allocated_storage` (optional): Max allocate storage
* `storage_type` (optional): Storage type (e.g. gp2, io1)
* `instance_class` (optional): Instance class
* `maintenance_window` (optional): Maintenance window
* `backup_window` (optional): Backup window
* `backup_retention_period` (optional): Backup retention period in days
* `skip_final_snapshot` (optional): Skip final snapshot
* `apply_immediately` (optional): Apply immediately, do not set this to true for production
* `copy_tags_to_snapshot` (optional): Copy tags to snapshots
* `additional_tags` (optional): Tags to set on the RDS instance

## Outputs
* `rds_postgres_pg_id`: ID of the RDS postgres parameter group
* `rds_postgres_id`: ID of the of the RDS instance

# References
* AWS RDS: https://aws.amazon.com/rds/features/
* Terraform module structure: https://www.terraform.io/docs/modules/index.html#standard-module-structure

# Development
## Releasing new versions
* Update version contained in `VERSION`
* Document changes in `CHANGELOG.md`
* Create a tag in github for the commit associated with the version

# License
Apache 2 Licensed. See LICENSE for full details.
