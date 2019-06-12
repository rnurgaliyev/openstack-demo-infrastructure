module "network_live" {
  source  = "./network"
  name    = "live"
  network = "${var.live_network}"
}

module "network_staging" {
  source  = "./network"
  name    = "staging"
  network = "${var.staging_network}"
}

output "live_network" {
  value = "${var.live_network}"
}

output "live_network_id" {
  value = "${module.network_live.network_id}"
}

output "live_vpnservice_id" {
  value = "${module.network_live.vpnservice_id}"
}

output "live_peer_id" {
  value = "${module.network_live.peer_id}"
}

output "staging_network" {
  value = "${var.staging_network}"
}

output "staging_network_id" {
  value = "${module.network_staging.network_id}"
}

output "staging_vpnservice_id" {
  value = "${module.network_staging.vpnservice_id}"
}

output "staging_peer_id" {
  value = "${module.network_staging.peer_id}"
}
