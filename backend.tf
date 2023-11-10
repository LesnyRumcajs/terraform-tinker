# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket                      = "hubert-cthulhu-grunt"
    endpoint                    = "https://fra1.digitaloceanspaces.com"
    key                         = "envs/terraform.tfstate"
    region                      = "eu-west-1"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}
