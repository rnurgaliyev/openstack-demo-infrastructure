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

# Security group used for testing stuff
resource "openstack_compute_secgroup_v2" "testing" {
  name        = "testing"
  description = "Security Group for testing and vagrant instances"

  # SSH from all the world
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  # ICMP from all the world
  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }

  # All TCP from SysEleven office
  rule {
    from_port   = 1
    to_port     = 65535
    ip_protocol = "tcp"
    cidr        = "151.252.43.0/24"
  }
}
