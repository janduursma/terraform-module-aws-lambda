variable "lambda_aliases" {
  description = "List of configuration blocks to create Lambda aliases."
  type        = any
  default     = []
}

variable "lambda_code_signing_configs" {
  description = "List of configuration blocks to create Lambda code signing configurations."
  type        = any
  default     = []
}

variable "lambda_event_source_mapping" {
  description = "Configuration block to create a Lambda event source mapping."
  type        = any
  default     = {}
}

variable "lambda_function" {
  description = "Configuration block to create a Lambda function."
  type        = any
  default     = {}
}

variable "lambda_function_event_invoke_config" {
  description = "Configuration block to create a Lambda function event invoke config."
  type        = any
  default     = {}
}

variable "lambda_function_recursion_config" {
  description = "Configuration block to create a Lambda function recursion config."
  type        = any
  default     = {}
}

variable "lambda_function_url" {
  description = "Configuration block to create a Lambda function URL."
  type        = any
  default     = {}
}

variable "lambda_invocation" {
  description = "Configuration block to create a Lambda invocation."
  type        = any
  default     = {}
}

variable "lambda_layer_versions" {
  description = "List of configuration blocks to create Lambda layer versions."
  type        = any
  default     = []
}

variable "lambda_layer_version_permissions" {
  description = "List of configuration blocks to create Lambda layer version permissions."
  type        = any
  default     = []
}

variable "lambda_permission" {
  description = "Configuration block to create a Lambda permission."
  type        = any
  default     = {}
}

variable "lambda_provisioned_concurrency_config" {
  description = "Configuration block to create a Lambda provisioned concurrency config."
  type        = any
  default     = {}
}

variable "lambda_runtime_management_config" {
  description = "Configuration block to create a Lambda runtime management config."
  type        = any
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
