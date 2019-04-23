terraform {
  backend "s3" {
    bucket                      = "rnu-terraform"
    key                         = "infrastructure.tfstate"
    endpoint                    = "s3.dbl.cloud.syseleven.net"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "openstack" {
  region = "dbl"
  alias  = "dbl"
}

provider "openstack" {
  region = "cbk"
  alias  = "cbk"
}
