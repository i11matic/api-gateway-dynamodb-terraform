variable "dynamodb_url_shortener_table_name" {
  description = "table name"
  type        = string
  default     = "url-shortener"
}

variable "dynamodb_url_shortener_hash_key" {
  description = "hash key"
  type        = string
  default     = "shortUrl"
}

variable "dynamodb_url_shortener_table_attribute_name" {
  description = "attribute name for the table"
  type        = string
  default     = "shortUrl"
}


variable "api_gateway_domain_name" {
  description = "domain name"
  type        = string
  default     = "notanotheradobo.com"
}

variable "api_gateway_access_log_destination_arn" {
  description = "arn of the log group"
  type        = string
  default     = "arn:aws:logs:us-west-2:766251705079:log-group:api-gateway"
}

variable "api_gateway_cert_arn" {
  description = "arn for certificate"
  type        = string
  default     = "arn:aws:acm:us-west-2:766251705079:certificate/fabff9a6-d46f-42f5-9070-3d7b325333e8"
}

variable "api_gateway_name" {
  description = "name of the api gateway"
  type        = string
  default     = "api-gateway"
}

variable "url_shortner_lambda_arn" {
  description = "ARN"
  type        = string
  default     = "arn:aws:lambda:us-west-2:766251705079:function:AwsCdkUrlShortenerStack-urlsshortenerlambda7929501-OHQTqwPxoV1w"
}

variable "authorizer_lambda_name" {
  description = "name for the lambda authorizer"
  type        = string
  default     = "lambda-authorizer"
}


variable "url_shortener_lambda_name" {
  description = "name for the url shortener lambda"
  type        = string
  default     = "AwsCdkUrlShortenerStack-urlsshortenerlambda7929501-OHQTqwPxoV1w"
}
