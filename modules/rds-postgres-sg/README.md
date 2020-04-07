# Tamr AWS RDS Security Groups Terraform Module
This terraform module creates the security group and the security group rules for the AWS RDS instance

# Example
```
module "rds_sg" {
    source = "./modules/rds-postgres-sg"
    spark_cluster_sg_ids = ["sg-examplesparksecuritygroup1", "sg-examplesparksecuritygroup2"]
    tamr_vm_sg_id = "sg-exampletamrvmsecuritygroup"
    vpc_id = "vpc-examplevpcid"
    security_group_name = "examplerdssecuritygroup"
    additional_cidrs = ["1.2.3.4/32"]
}
``` 

# Variables
## Inputs:
* `tamr_vm_sg_id` (required): Security group id attached to the tamr vm
* `spark_cluster_sg_ids` (required): List of Security groups attached to the ec2 instances of EMR Spark
* `vpc_id` (required): VPC ID for the rds security group
* `security_group_name` (optional): Name for the security group for the rds instance
* `additional_cidrs` (optional): List of additional CIDR to connect to RDS Postgres instance
* `additional_tags` (optional): Tags to set on the RDS instance security group

## Outputs:
* `rds_sg_id`: ID of the security group attached to the RDS instance

# AWS Resources created
This terraform module creates 1 Security Group:
* A security group for the RDS instance

This terraform module also creates Security Group Rules. The number of Security Group rules vary depending on the additional CIDRs provided.
