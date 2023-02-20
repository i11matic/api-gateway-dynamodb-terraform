data "aws_caller_identity" "current" {}

module "api_gateway" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "2.2.2"

  name          = var.api_gateway_name
  protocol_type = "HTTP"

  cors_configuration = {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }

  domain_name                 = var.api_gateway_domain_name
  domain_name_certificate_arn = var.api_gateway_cert_arn


  integrations = {
    "POST /" = {
      lambda_arn             = var.url_shortner_lambda_arn
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
    }

    "GET /" = {
      lambda_arn             = var.url_shortner_lambda_arn
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
    }

    "$default" = {
      lambda_arn = var.url_shortner_lambda_arn
    }
  }
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


resource "aws_dax_cluster" "dax" {
  cluster_name       = var.dax_cluster_name
  iam_role_arn       = aws_iam_role.dax_role.arn
  node_type          = var.dax_node_type
  replication_factor = var.dax_replication_factor
  subnet_group_name  = var.dax_subnet_group_name
  depends_on         = [aws_dax_subnet_group.dax_subnet_group]
}

resource "aws_dax_subnet_group" "dax_subnet_group" {
  name       = var.dax_subnet_group_name
  subnet_ids = var.dax_subnet_group
}

resource "aws_iam_role" "dax_role" {
  name = "dax_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "dax.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "dax_dynamodb_policy" {
  name = "dax_dynamodb_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:DescribeTable",
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:BatchGetItem",
          "dynamodb:BatchWriteItem",
          "dynamodb:ConditionCheckItem"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:dynamodb:us-west-2:${data.aws_caller_identity.current.account_id}:*"

      },
    ]
  })
}

resource "aws_iam_policy_attachment" "dax_iam_policy_attachment" {
  name       = "dax iam policy attachment"
  roles      = [aws_iam_role.dax_role.name]
  policy_arn = aws_iam_policy.dax_dynamodb_policy.arn

}

