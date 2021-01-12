## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | n/a | `string` | n/a | yes |
| name | n/a | `string` | n/a | yes |
| vpc\_id | n/a | `string` | n/a | yes |
| create\_security\_group | create the security group | `bool` | `true` | no |
| egress\_cidr\_rules | List of cidr block rules | `list(map(string))` | `[]` | no |
| ingress\_cidr\_rules | List of cidr block rules | `list(map(string))` | `[]` | no |
| ingress\_security\_group\_rules | List of cross security group rules | `list(map(string))` | `[]` | no |
| security\_group\_id | n/a | `string` | `""` | no |
| tags | Tags to apply to security group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| sg\_id | n/a |
