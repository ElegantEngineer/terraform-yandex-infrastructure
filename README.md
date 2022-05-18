# Terraform modules for Yandex.Cloud VPC, Compute, Storage, IAM

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| yandex | ~> 0.74.0 |

## Providers

| Name | Version |
|------|---------|
| yandex | ~> 0.74.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| yc\_token | Yandex Cloud token | `string` | no | yes |
| yc\_cloud_id | Yandex Cloud id | `string` | no | yes |
| yc\_folder_id | Yandex Cloud folder id | `string` | no | yes |
| yc\_zone | Yandex Cloud compute default zone | `string` | ru-central1-a | no |
| project\_name | Project name | `string` | `project-1` | no |
| env\_name | Environment name | `string` | dev | no |

## Outputs

| Name | Description |
|------|-------------|
| compute\_instance\_external\_ip | The external IP address of the instance |
| compute\_instance\_internal\_ip | The internal IP address of the instance |

## Description

* It creates simple infrastructure for typical web application
* Created infrastructure would have:

    1. Simple network
    2. Instances for frontend and backend
    3. Each compute instance may have additional disks
    4. Public and Private buckets
    5. Service account to manage buckets