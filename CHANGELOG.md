# Tamr Terraform Template Repo

## v1.0.0 - April 12th 2021
* Updates minimum Terraform version to 13
* Updates minimum AWS provider version to 3.36.0

## v0.4.1 - Nov 6th 2020
* Adds input `db_port` to configure port that postgres database accepts connections on
* Fixes example so it accepts `ingress_sg_ids` as input

## v0.4.0 - Oct 27th 2020
* Consolidates inputs `tamr_vm_sg_id` and `spark_cluster_sg_ids` into one input, `ingress_sg_ids`

## v0.3.1 - Sep 10th 2020
* Adds outputs, `rds_username` and `rds_dbname`

## v0.3.0 - Sep 10th 2020
* Adds creation of aws_db_subnet_group resource
  * Adds variable rds_subnet_ids to specify subnet IDs in subnet group
* Renames variable subnet_name to subnet_group_name

## v0.2.1 - Jun 22nd 2020
* Adds variable "engine_version" to set the postgres version
* Formatting and documentation updates

## v0.1.0 - Feb 25th 2020
* Initing project
