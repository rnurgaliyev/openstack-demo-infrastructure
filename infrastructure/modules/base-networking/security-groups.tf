resource "openstack_compute_secgroup_v2" "openvpn" {
  name        = "openvpn"
  description = "Security Group for OpenVPN Instances"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 1194
    to_port     = 1194
    ip_protocol = "udp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "internal" {
  name        = "internal"
  description = "Allow full access from inside"

  rule {
    from_port   = 1
    to_port     = 65535
    ip_protocol = "tcp"
    cidr        = "10.0.0.0/8"
  }

  rule {
    from_port   = 1
    to_port     = 65535
    ip_protocol = "udp"
    cidr        = "10.0.0.0/8"
  }

  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}
