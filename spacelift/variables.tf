variable "repository_name" {
  type        = string
  description = "The name of the Git repository holding the infrastructure code."
  # Only change this if you renamed your fork.
  default = "sample-spacelift-aws-workshop-repo"
}

variable "repository_branch" {
  type        = string
  description = "The branch the stacks track."
  default     = "main"
}

variable "tf_version" {
  type        = string
  description = "The OpenTofu version the stacks use."
  default     = "1.10.3"
}

variable "vcs" {
  type = object({
    type       = string
    enterprise = optional(bool, false)
    namespace  = optional(string)
    id         = optional(string)
    url        = optional(string)
  })
  description = "VCS integration the stacks source their code from."

  # CHANGE ME: namespace is the GitHub user or organisation that owns your fork,
  # and id is the ID of your Spacelift VCS integration (Integrate services >
  # GitHub). enterprise = true selects a named GitHub (custom app) integration by
  # id. To use your account's default github.com integration instead, set
  # enterprise = false and remove id.
  default = {
    type       = "GITHUB"
    enterprise = true
    namespace  = "<YOUR_GITHUB_USER_OR_ORG>"
    id         = "<YOUR_SPACELIFT_VCS_INTEGRATION_ID>"
  }
}

variable "aws_integration_id" {
  type        = string
  description = "The ID of the Spacelift AWS integration the stacks assume for cloud credentials."

  # CHANGE ME: the ID of your Spacelift AWS integration. Find it under
  # Integrate services > AWS in the Spacelift UI.
  default = "<YOUR_SPACELIFT_AWS_INTEGRATION_ID>"
}

variable "kubectl_version" {
  type        = string
  description = "The kubectl version the argocd stack uses. 'latest' takes the newest version Spacelift offers."
  default     = "latest"
}

variable "argocd_namespace" {
  type        = string
  description = "Namespace the argocd stack applies its manifests into. Must match argocd_namespace in aws/eks/variables.tf."
  default     = "argocd"
}
