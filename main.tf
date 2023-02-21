data "aws_caller_identity" "current" {}



data "aws_lambda_function" "authorizer_lambda" {
  function_name = var.authorizer_lambda_name
}


module "api_gateway" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "2.2.2"

  name          = var.api_gateway_name
  protocol_type = "HTTP"

  default_stage_access_log_destination_arn = var.api_gateway_access_log_destination_arn
  default_stage_access_log_format          = "$context.identity.sourceIp - - [$context.requestTime] \"$context.httpMethod $context.routeKey $context.protocol\" $context.status $context.responseLength $context.requestId $context.integrationErrorMessage $context.error.message $context.authorizer.error"

  cors_configuration = {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }

  domain_name                 = var.api_gateway_domain_name
  domain_name_certificate_arn = var.api_gateway_cert_arn


  integrations = {
    "POST /create" = {
      lambda_arn             = var.url_shortner_lambda_arn
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
      authorizer_id          = aws_apigatewayv2_authorizer.lambda_auth.id
      integration_method     = "POST"
    }

    "GET /get/{proxy+}" = {
      lambda_arn             = var.url_shortner_lambda_arn
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
      integration_method     = "GET"
    }

    "$default" = {
      lambda_arn = var.url_shortner_lambda_arn
    }
  }
}

resource "aws_apigatewayv2_authorizer" "lambda_auth" {
  api_id                            = module.api_gateway.apigatewayv2_api_id
  authorizer_type                   = "REQUEST"
  authorizer_uri                    = data.aws_lambda_function.authorizer_lambda.invoke_arn
  identity_sources                  = ["$request.header.headerauth1", "$request.querystring.QueryString1"]
  name                              = "lambda-auth"
  authorizer_payload_format_version = "2.0"
  enable_simple_responses           = true
}

resource "aws_dynamodb_table" "url_shortener" {
  name         = var.dynamodb_url_shortener_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.dynamodb_url_shortener_hash_key


  attribute {
    name = var.dynamodb_url_shortener_table_attribute_name
    type = "S"
  }
}


resource "aws_lambda_permission" "authorizer_lambda_permission" {
  statement_id  = "authorizer_lambda_invoke"
  action        = "lambda:InvokeFunction"
  function_name = var.authorizer_lambda_name
  principal     = "apigateway.amazonaws.com"


  source_arn = "arn:aws:execute-api:us-west-2:${data.aws_caller_identity.current.account_id}:${module.api_gateway.apigatewayv2_api_id}/*/*/*"
}

resource "aws_lambda_permission" "url_shortner_lambda_permission_create" {
  statement_id  = "url_shortner_lambda_invoke_create"
  action        = "lambda:InvokeFunction"
  function_name = var.url_shortener_lambda_name
  principal     = "apigateway.amazonaws.com"


  source_arn = "arn:aws:execute-api:us-west-2:${data.aws_caller_identity.current.account_id}:${module.api_gateway.apigatewayv2_api_id}/*/*/create"
}


resource "aws_lambda_permission" "url_shortner_lambda_permission_get" {
  statement_id  = "url_shortner_lambda_invoke_get"
  action        = "lambda:InvokeFunction"
  function_name = var.url_shortener_lambda_name
  principal     = "apigateway.amazonaws.com"


  source_arn = "arn:aws:execute-api:us-west-2:${data.aws_caller_identity.current.account_id}:${module.api_gateway.apigatewayv2_api_id}/*/*/get/{proxy+}"
}
