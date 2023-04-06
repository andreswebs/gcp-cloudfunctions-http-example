variable "region" {
  type        = string
  description = "Compute region"
}

variable "function_service_account_name" {
  type        = string
  description = "Function service account name"
  default     = "function-test-http"
}

variable "function_name" {
  type        = string
  description = "Function name"
  default     = "function-test-http"
}

variable "function_description" {
  type        = string
  description = "The function description"
  default     = "Test Function"
}

variable "code_artifacts_bucket" {
  type        = string
  description = "Name of the bucket containing the Cloud Functions `.zip` file"
}

variable "function_object" {
  type        = string
  description = "Bucket object path to the Cloud Functions `.zip` file"
  default     = "function-test-http.zip"
}

variable "function_retry" {
  type        = bool
  description = "Enable `retry` on the function failure policy?"
  default     = false
}

variable "schedule_enabled" {
  type        = bool
  description = "(Optional) Enable schedule?"
  default     = false
}

variable "schedule_name" {
  type        = string
  description = "Name of the Cloud Scheduler job"
  default     = "function-test-http"
}

variable "schedule_time_zone" {
  type        = string
  description = "Cloud Scheduler job time zone"
  default     = "UTC"
}

variable "schedule_cron" {
  type        = string
  description = "Cron expression for backup check trigger"
  default     = "0/5 * * * *"
}

variable "schedule_http_body" {
  type        = string
  description = "Body of the HTTP POST request sent by Cloud Scheduler job to Cloud Function"
  default     = <<EOT
    {}
  EOT
}
