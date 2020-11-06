<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ingress\_sg\_ids | List of security group IDs to allow ingress from (i.e. Spark cluster SG IDs, Tamr VM SG ID) | `list(string)` | n/a | yes |
| subnet\_ids | List of at least 2 subnets in different AZs for DB subnet group | `list(string)` | n/a | yes |
| vpc\_id | VPC ID of network. | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
