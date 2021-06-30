<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ingress\_sg\_ids | List of security group IDs to allow ingress from (i.e. Spark cluster SG IDs, Tamr VM SG ID) | `list(string)` | n/a | yes |
| name-prefix | A string to prepend to names of resources created by this example | `any` | n/a | yes |
| subnet\_ids | List of at least 2 subnets in different AZs for DB subnet group | `list(string)` | n/a | yes |
| vpc\_id | VPC ID of network. | `string` | n/a | yes |
| additional\_ports | Additional ports to add to the output of this module | `list(number)` | `[]` | no |
| ports | Ports used by the Elasticsearch | `list(number)` | <pre>[<br>  5432<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| ingress\_ports | List of ingress ports |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
