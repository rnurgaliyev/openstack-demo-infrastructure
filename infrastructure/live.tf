################################################################################
################################################################################

data "openstack_images_image_v2" "jumphost" {
  name        = "imple-jumphost"
  most_recent = true
}

resource "openstack_networking_router_v2" "live" {
  name                = "live"
  admin_state_up      = true
  external_network_id = "${data.openstack_networking_network_v2.ext_net.id}"
}

# Network
resource "openstack_networking_network_v2" "live" {
  name           = "live"
  admin_state_up = "true"
}

# Subnet
resource "openstack_networking_subnet_v2" "live" {
  name            = "live"
  network_id      = "${openstack_networking_network_v2.live.id}"
  cidr            = "172.31.254.0/24"
  ip_version      = 4
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
}

# Router port
resource "openstack_networking_router_interface_v2" "port_router_live" {
  router_id = "${openstack_networking_router_v2.live.id}"
  subnet_id = "${openstack_networking_subnet_v2.live.id}"
}

################################################################################
################################################################################
resource "openstack_compute_secgroup_v2" "jumphost" {
  name        = "jumphost"
  description = "Security Group for Jumphost"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_instance_v2" "jumphost" {
  name        = "Jumphost"
  image_id    = "${data.openstack_images_image_v2.jumphost.id}"
  flavor_name = "m1.micro"
  key_pair    = "${openstack_compute_keypair_v2.imple.name}"

  security_groups = [
    "default",
    "${openstack_compute_secgroup_v2.jumphost.name}",
  ]

  network {
    name = "${openstack_networking_network_v2.live.name}"
  }
}

resource "openstack_compute_floatingip_v2" "jumphost" {
  pool = "${data.openstack_networking_network_v2.ext_net.name}"
}

# Floating IP assoctiations
resource "openstack_compute_floatingip_associate_v2" "fip_assoc_test" {
  floating_ip = "${openstack_compute_floatingip_v2.jumphost.address}"
  instance_id = "${openstack_compute_instance_v2.jumphost.id}"
}