################################################################################
################################################################################

resource "openstack_networking_router_v2" "testing" {
  name                = "testing"
  admin_state_up      = true
  external_network_id = "${data.openstack_networking_network_v2.ext_net.id}"
}

# Network
resource "openstack_networking_network_v2" "testing" {
  name           = "testing"
  admin_state_up = "true"
}

# Subnet
resource "openstack_networking_subnet_v2" "testing" {
  name            = "testing"
  network_id      = "${openstack_networking_network_v2.testing.id}"
  cidr            = "172.16.254.0/24"
  ip_version      = 4
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
}

# Router port
resource "openstack_networking_router_interface_v2" "port_router_testing" {
  router_id = "${openstack_networking_router_v2.testing.id}"
  subnet_id = "${openstack_networking_subnet_v2.testing.id}"
}
