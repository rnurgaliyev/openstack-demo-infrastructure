# Base Modules

module "base_configuration_dbl" {
  source = "./modules/base-configuration"

  providers = {
    openstack = openstack.dbl
  }
}

module "base_networking_dbl" {
  source          = "./modules/base-networking"
  live_network    = "10.202.1.0/24"
  staging_network = "10.202.2.0/24"

  providers = {
    openstack = openstack.dbl
  }
}
