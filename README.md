# k8scluster-terraform

This terraform plan creates the k8s cluster and node group with seperate vpc for you.

## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >=1.0.0 |
| aws | >=3.0 |

## Providers

|Name | Version |
| --- | ------- |
| aws | >=3.0 |

## Terraform Resources

| Name | Type |
| ---------| ------------|
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | Resource |
| [aws_iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | Resource |
| [aws_eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | Resource |
| [aws_eks_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | Resource |
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | Resource |
| [aws_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | Resource |
| [aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | Resource |
| [aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | Resource |
| [aws_main_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/main_route_table_association) | Resource |
| [aws_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | Resource |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | Resource |
| [aws_key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | Resource |

## Terraform Variables
 Edit the `vars.tf` file to add the variables as per your need.

| Name |  Type | Required|
| ---- |  ---- | ------- |
| `instance`  | string | yes |
| `aws_access_key` |  string | yes
| `aws_secrete_key` | string | yes |
| `region` | string | yes |
| `public_key` |  string | yes |
| `vpc_cidr` | string | yes |
| `pubsub1_cidr`| string | yes |
| `pubsub2_cidr`| string | yes |
| `pubsub3_cidr`| string | yes |

## Output

| Name | Description |
| ---- | ----------- |
| eks_cluster_connection_string | Connect the eks cluster through AWS cli using the connection string|


## Usage
- Clone the repo
```bash 

git clone https://github.com/arunodhayamsam/k8scluster-terraform.git
pushd k8scluster-terraform

```
- Apply terraform commands

```bash
terraform init
terraform plan
terraform apply
```