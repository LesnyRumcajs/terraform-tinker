terraform {
  required_version = ">= 0.16.0"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 2.14.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.5.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_token
}

variable "newrelic_personal_apikey" {
  sensitive = true
}
variable "newrelic_account_id" {
  sensitive = true
}
variable "newrelic_region" {
  sensitive = true
}
variable "digitalocean_token" {
  sensitive = true
}

provider "newrelic" {
  account_id = var.newrelic_account_id
  api_key = var.newrelic_personal_apikey
  region = var.newrelic_region
}
