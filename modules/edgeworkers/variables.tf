variable "group_id" {
  type        = string
  description = "group ID"
}

variable "ew_name" {
  type        = string
  description = "EdgeWorker name"
}

variable "resource_tier" {
  type        = number
  description = "Resource Tier ID "
  default     = 100
}