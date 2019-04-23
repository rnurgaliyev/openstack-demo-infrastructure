# Data gathered from OpenStack
data "openstack_networking_network_v2" "ext_net" {
  name = "ext-net"
}

# Network
resource "openstack_networking_network_v2" "network" {
  name = "${var.name}"
}

# Subnet
resource "openstack_networking_subnet_v2" "network" {
  name            = "${var.name}"
  network_id      = "${openstack_networking_network_v2.network.id}"
  cidr            = "${var.network}"
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
}

# Router
resource "openstack_networking_router_v2" "network" {
  name                = "${var.name}"
  external_network_id = "${data.openstack_networking_network_v2.ext_net.id}"
}

# Router Interface
resource "openstack_networking_router_interface_v2" "network" {
  router_id = "${openstack_networking_router_v2.network.id}"
  subnet_id = "${openstack_networking_subnet_v2.network.id}"
}

# VPNaaS Service
resource "openstack_vpnaas_service_v2" "network" {
  depends_on     = ["openstack_networking_router_interface_v2.network"]
  name           = "${var.name}"
  router_id      = "${openstack_networking_router_v2.network.id}"
  subnet_id      = "${openstack_networking_subnet_v2.network.id}"
  admin_state_up = "true"
}

output "network_id" {
  value = "${openstack_networking_network_v2.network.id}"
}

output "vpnservice_id" {
  value = "${openstack_vpnaas_service_v2.network.id}"
}

output "peer_id" {
  value = "${openstack_vpnaas_service_v2.network.external_v4_ip}"
}
