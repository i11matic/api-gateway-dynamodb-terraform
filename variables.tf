variable "dynamodb_url_shortener_table_name" {
  description = "table name"
  type        = string
  default     = "url"
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


variable "dax_cluster_name"{
    description = "cluster name for the dax"
    type = string
    default = "dax-cluster"
}


variable "dax_node_type"{
    description = "node type"
    type = string
    default = "dax.t3.small"
}

variable "dax_replication_factor"{
    description = "node type"
    type = number
    default = 1
}


variable "dax_subnet_group"{
    description = "subnet group for dax"
    type = list
    default = ["subnet-076c4ec57cf3fcf54"]
}

variable "dax_subnet_group_name"{
    description = "name of the subnet group"
    type = string
    default = "dax-subnet-group"
}
