variable "project_id" {
  type        = string
  description = "The target Google Cloud Project ID"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "The targeted deployment region"
}
