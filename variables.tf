variable "project_name" {
  type        = string
  description = "Project name (used globally)"
  default     = "azure-fun-bytes"

  validation {
    # check the length of the string and ensure it does not contain spaces
    # see https://www.terraform.io/docs/language/values/variables.html#custom-validation-rules
    condition     = (
      length(var.project_name) > 4 &&
      length(var.project_name) < 32 &&
      replace(var.project_name, " ", "") == var.project_name
    )

    error_message = "The project_name must be between 4 and 32 characters and may not contain spaces."
  }
}

variable "tags" {
  type = map(string)
  description = "Project tags for resources"
  default = {
    "Operator" = "Terraform"
  }
}

variable "region" {
  type        = string
  description = "Azure Region to create resource(s) in"
  default     = "West US"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version to create cluster with"
  default     = "1.19.3"
}
