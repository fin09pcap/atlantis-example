terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.12.0"
    }
    random = {
      source  = "hashicorp/random"
    }
  }
  backend "local" {}
}

###
# vault configuration
###

variable "vault_addr" {
  description = "vault address. Set from VAULT_ADDR"
}

provider "vault" {
  address = var.vault_addr
}