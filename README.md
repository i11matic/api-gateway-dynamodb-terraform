## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.55.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_api_gateway"></a> [api\_gateway](#module\_api\_gateway) | terraform-aws-modules/apigateway-v2/aws | 2.2.2 |

## Resources

| Name | Type |
|------|------|
| [aws_apigatewayv2_authorizer.lambda_auth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_authorizer) | resource |
| [aws_dynamodb_table.url_shortener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_lambda_permission.authorizer_lambda_permission](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_permission.url_shortner_lambda_permission](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_lambda_function.authorizer_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lambda_function) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_gateway_access_log_destination_arn"></a> [api\_gateway\_access\_log\_destination\_arn](#input\_api\_gateway\_access\_log\_destination\_arn) | arn of the log group | `string` | `"arn:aws:logs:us-west-2:766251705079:log-group:api-gateway"` | no |
| <a name="input_api_gateway_cert_arn"></a> [api\_gateway\_cert\_arn](#input\_api\_gateway\_cert\_arn) | arn for certificate | `string` | `"arn:aws:acm:us-west-2:766251705079:certificate/fabff9a6-d46f-42f5-9070-3d7b325333e8"` | no |
| <a name="input_api_gateway_domain_name"></a> [api\_gateway\_domain\_name](#input\_api\_gateway\_domain\_name) | domain name | `string` | `"notanotheradobo.com"` | no |
| <a name="input_api_gateway_name"></a> [api\_gateway\_name](#input\_api\_gateway\_name) | name of the api gateway | `string` | `"api-gateway"` | no |
| <a name="input_authorizer_lambda_name"></a> [authorizer\_lambda\_name](#input\_authorizer\_lambda\_name) | name for the lambda authorizer | `string` | `"lambda-authorizer"` | no |
| <a name="input_dynamodb_url_shortener_hash_key"></a> [dynamodb\_url\_shortener\_hash\_key](#input\_dynamodb\_url\_shortener\_hash\_key) | hash key | `string` | `"shortUrl"` | no |
| <a name="input_dynamodb_url_shortener_table_attribute_name"></a> [dynamodb\_url\_shortener\_table\_attribute\_name](#input\_dynamodb\_url\_shortener\_table\_attribute\_name) | attribute name for the table | `string` | `"shortUrl"` | no |
| <a name="input_dynamodb_url_shortener_table_name"></a> [dynamodb\_url\_shortener\_table\_name](#input\_dynamodb\_url\_shortener\_table\_name) | table name | `string` | `"url-shortener"` | no |
| <a name="input_url_shortener_lambda_name"></a> [url\_shortener\_lambda\_name](#input\_url\_shortener\_lambda\_name) | name for the url shortener lambda | `string` | `"AwsCdkUrlShortenerStack-urlsshortenerlambda7929501-OHQTqwPxoV1w"` | no |
| <a name="input_url_shortner_lambda_arn"></a> [url\_shortner\_lambda\_arn](#input\_url\_shortner\_lambda\_arn) | ARN | `string` | `"arn:aws:lambda:us-west-2:766251705079:function:AwsCdkUrlShortenerStack-urlsshortenerlambda7929501-OHQTqwPxoV1w"` | no |

## Outputs

No outputs.
