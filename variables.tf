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
  default     = "api.notanotheradobo.com"
}

variable "api_gateway_access_log_destination_arn" {
  description = "arn of the log group"
  type        = string
  default     = "arn:aws:logs:us-west-2:766251705079:log-group:api-gateway"
}

variable "api_gateway_cert_arn" {
  description = "arn for certificate"
  type        = string
  default     = "arn:aws:acm:us-west-2:766251705079:certificate/544c3e9b-45dc-4ff1-8650-c7da9dbb8042"
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

variable "url_shortener_lambda_alias_name" {
  description = "alias name for lambda"
  type        = string
  default     = "Prod"
}

variable "url_shortener_lambda_provisioned_concurrent_executions" {
  description = "number of concurrency units"
  type        = number
  default     = 2

}

variable "dax_cluster_name" {
  description = "cluster name for the dax"
  type        = string
  default     = "dax-cluster"
}


variable "dax_node_type" {
  description = "node type"
  type        = string
  default     = "dax.t3.small"
}

variable "dax_replication_factor" {
  description = "node type"
  type        = number
  default     = 1
}


variable "dax_subnet_group" {
  description = "subnet group for dax"
  type        = list(any)
  default     = ["subnet-02d4611a41ef69e03"]
}

variable "dax_subnet_group_name" {
  description = "name of the subnet group"
  type        = string
  default     = "dax-subnet-group"
}


variable "route_53_zone_name" {
  description = "name of the route 53 zone"
  type        = string
  default     = "notanotheradobo.com"
}
