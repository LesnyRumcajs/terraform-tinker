# Determine the environment from the directory name
locals {
  env_name = replace(path_relative_to_include(), "environments/", "")
}

inputs = {
  env_name = local.env_name
}

# Remote state, separate for each environment
remote_state {
  backend = "s3"
  generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "hubert-cthulhu-grunt"
    //key = "envs/${local.env_name}/terraform.tfstate"
    key = "envs/terraform.tfstate"
    region = "eu-west-1"
    endpoint = "https://fra1.digitaloceanspaces.com"
    //endpoints = {
    //  s3 = "https://fra1.digitaloceanspaces.com"
    //}
    skip_bucket_versioning = true
    skip_bucket_ssencryption = true
    skip_bucket_root_access = true
    skip_bucket_public_access_blocking = true
    skip_bucket_enforced_tls = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}
