# Base Modules

module "base_configuration_cbk" {
  source = "./modules/base-configuration"

  providers = {
    openstack = openstack.cbk
  }
}

module "base_networking_cbk" {
  source          = "./modules/base-networking"
  live_network    = "10.201.1.0/24"
  staging_network = "10.201.2.0/24"

  providers = {
    openstack = openstack.cbk
  }
}
