
variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "image_tag_mutability" {
  description = "Whether image tags are MUTABLE or IMMUTABLE"
  type        = string
  default     = "MUTABLE"

  validation {
    condition = contains(
      ["MUTABLE", "IMMUTABLE"],
      var.image_tag_mutability
    )
    error_message = "Use MUTABLE or IMMUTABLE."
  }
}

variable "scan_on_push" {
  description = "Enable image scanning when images are pushed"
  type        = bool
  default     = true
}

variable "encryption_type" {
  description = "Repository encryption type"
  type        = string
  default     = "AES256"

  validation {
    condition = contains(
      ["AES256", "KMS"],
      var.encryption_type
    )
    error_message = "Use AES256 or KMS."
  }
}

variable "enable_lifecycle_policy" {
  description = "Whether to create an image lifecycle policy"
  type        = bool
  default     = true
}

variable "max_image_count" {
  description = "Number of images to retain"
  type        = number
  default     = 10

  validation {
    condition     = var.max_image_count >= 1
    error_message = "max_image_count must be at least 1."
  }
}

variable "tags" {
  description = "Tags applied to the ECR repository"
  type        = map(string)
  default     = {}
}