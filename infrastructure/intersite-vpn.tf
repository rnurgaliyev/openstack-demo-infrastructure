variable "ipsec_staging_psk" {
  type = string
}

variable "ipsec_live_psk" {
  type = string
}

# Staging IPsec VPN
resource "openstack_vpnaas_site_connection_v2" "staging_dbl_to_cbk" {
  name           = "Staging DBL to CBK"
  provider       = openstack.dbl
  psk            = var.ipsec_staging_psk
  ikepolicy_id   = module.base_networking_dbl.ikepolicy_id
  ipsecpolicy_id = module.base_networking_dbl.ipsecpolicy_id
  vpnservice_id  = module.base_networking_dbl.staging_vpnservice_id
  peer_id        = module.base_networking_cbk.staging_peer_id
  peer_address   = module.base_networking_cbk.staging_peer_id
  peer_cidrs     = [module.base_networking_cbk.staging_network]
  admin_state_up = "true"
}

resource "openstack_vpnaas_site_connection_v2" "staging_cbk_to_dbl" {
  name           = "Staging CBK to DBL"
  provider       = openstack.cbk
  psk            = var.ipsec_staging_psk
  ikepolicy_id   = module.base_networking_cbk.ikepolicy_id
  ipsecpolicy_id = module.base_networking_cbk.ipsecpolicy_id
  vpnservice_id  = module.base_networking_cbk.staging_vpnservice_id
  peer_id        = module.base_networking_dbl.staging_peer_id
  peer_address   = module.base_networking_dbl.staging_peer_id
  peer_cidrs     = [module.base_networking_dbl.staging_network]
  admin_state_up = "true"
}

# Live IPsec VPN
resource "openstack_vpnaas_site_connection_v2" "live_dbl_to_cbk" {
  name           = "Live DBL to CBK"
  provider       = openstack.dbl
  psk            = var.ipsec_live_psk
  ikepolicy_id   = module.base_networking_dbl.ikepolicy_id
  ipsecpolicy_id = module.base_networking_dbl.ipsecpolicy_id
  vpnservice_id  = module.base_networking_dbl.live_vpnservice_id
  peer_id        = module.base_networking_cbk.live_peer_id
  peer_address   = module.base_networking_cbk.live_peer_id
  peer_cidrs     = [module.base_networking_cbk.live_network]
  admin_state_up = "true"
}

resource "openstack_vpnaas_site_connection_v2" "live_cbk_to_dbl" {
  name           = "Live CBK to DBL"
  provider       = openstack.cbk
  psk            = var.ipsec_live_psk
  ikepolicy_id   = module.base_networking_cbk.ikepolicy_id
  ipsecpolicy_id = module.base_networking_cbk.ipsecpolicy_id
  vpnservice_id  = module.base_networking_cbk.live_vpnservice_id
  peer_id        = module.base_networking_dbl.live_peer_id
  peer_address   = module.base_networking_dbl.live_peer_id
  peer_cidrs     = [module.base_networking_dbl.live_network]
  admin_state_up = "true"
}
