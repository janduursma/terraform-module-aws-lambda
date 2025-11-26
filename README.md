# AWS Lambda Terraform module

Terraform module which creates Lambda resources on AWS.

## Available Features

- Aliases
- Code signing configs
- Event source mappings
- Function
- Function event invoke config
- Function recursion config
- Function URL
- Invocation
- Layer versions
- Layer version permissions
- Permission
- Provisioned concurrency config
- Runtime management config

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lambda_alias.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_alias) | resource |
| [aws_lambda_code_signing_config.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_code_signing_config) | resource |
| [aws_lambda_event_source_mapping.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_event_source_mapping) | resource |
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_function) | resource |
| [aws_lambda_function_event_invoke_config.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_function_event_invoke_config) | resource |
| [aws_lambda_function_recursion_config.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_function_recursion_config) | resource |
| [aws_lambda_function_url.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_function_url) | resource |
| [aws_lambda_invocation.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_invocation) | resource |
| [aws_lambda_layer_version.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_layer_version) | resource |
| [aws_lambda_layer_version_permission.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_layer_version_permission) | resource |
| [aws_lambda_permission.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_permission) | resource |
| [aws_lambda_provisioned_concurrency_config.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_provisioned_concurrency_config) | resource |
| [aws_lambda_runtime_management_config.this](https://registry.terraform.io/providers/hashicorp/aws/6.20.0/docs/resources/lambda_runtime_management_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lambda_aliases"></a> [lambda\_aliases](#input\_lambda\_aliases) | List of configuration blocks to create Lambda aliases. | `any` | `[]` | no |
| <a name="input_lambda_code_signing_configs"></a> [lambda\_code\_signing\_configs](#input\_lambda\_code\_signing\_configs) | List of configuration blocks to create Lambda code signing configurations. | `any` | `[]` | no |
| <a name="input_lambda_event_source_mapping"></a> [lambda\_event\_source\_mapping](#input\_lambda\_event\_source\_mapping) | Configuration block to create a Lambda event source mapping. | `any` | `{}` | no |
| <a name="input_lambda_function"></a> [lambda\_function](#input\_lambda\_function) | Configuration block to create a Lambda function. | `any` | `{}` | no |
| <a name="input_lambda_function_event_invoke_config"></a> [lambda\_function\_event\_invoke\_config](#input\_lambda\_function\_event\_invoke\_config) | Configuration block to create a Lambda function event invoke config. | `any` | `{}` | no |
| <a name="input_lambda_function_recursion_config"></a> [lambda\_function\_recursion\_config](#input\_lambda\_function\_recursion\_config) | Configuration block to create a Lambda function recursion config. | `any` | `{}` | no |
| <a name="input_lambda_function_url"></a> [lambda\_function\_url](#input\_lambda\_function\_url) | Configuration block to create a Lambda function URL. | `any` | `{}` | no |
| <a name="input_lambda_invocation"></a> [lambda\_invocation](#input\_lambda\_invocation) | Configuration block to create a Lambda invocation. | `any` | `{}` | no |
| <a name="input_lambda_layer_version_permissions"></a> [lambda\_layer\_version\_permissions](#input\_lambda\_layer\_version\_permissions) | List of configuration blocks to create Lambda layer version permissions. | `any` | `[]` | no |
| <a name="input_lambda_layer_versions"></a> [lambda\_layer\_versions](#input\_lambda\_layer\_versions) | List of configuration blocks to create Lambda layer versions. | `any` | `[]` | no |
| <a name="input_lambda_permission"></a> [lambda\_permission](#input\_lambda\_permission) | Configuration block to create a Lambda permission. | `any` | `{}` | no |
| <a name="input_lambda_provisioned_concurrency_config"></a> [lambda\_provisioned\_concurrency\_config](#input\_lambda\_provisioned\_concurrency\_config) | Configuration block to create a Lambda provisioned concurrency config. | `any` | `{}` | no |
| <a name="input_lambda_runtime_management_config"></a> [lambda\_runtime\_management\_config](#input\_lambda\_runtime\_management\_config) | Configuration block to create a Lambda runtime management config. | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
