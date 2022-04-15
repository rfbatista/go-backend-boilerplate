variable "HASHICORP_ORGANIZATION_NAME" {
	type = string
	description = "Name of the organization containing the target workspace"
}

variable "HASHICORP_WORKSPACE_NAME" {
	type = string
	description = "The full name of one remote workspace"
}

variable "HASHICORP_TOKEN" {
	type = string
	description = "The token used to authenticate with the remote backend"
}

terraform {
	cloud {
		organization = var.HASHICORP_ORGANIZATION_NAME
		token = var.HASHICORP_TOKEN
		workspaces {
			name = var.HASHICORP_WORKSPACE_NAME
		}
	}

	required_version = ">= 0.13.0"
}