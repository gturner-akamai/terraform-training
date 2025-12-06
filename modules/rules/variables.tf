variable "ab_test" {
  type        = string
  description = "A/B testing"
}

variable "origin_a" {
  type        = string
  description = "Origin hostname for test A"
}

variable "origin_b" {
  type        = string
  description = "Origin hostname for test B "
}
