# Security group A
resource "openstack_compute_secgroup_v2" "sg_A" {
  name        = "sg_A"
  description = "Security Group A"

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

  rule {
    from_port     = 80
    to_port       = 80
    ip_protocol   = "tcp"
    from_group_id = "${openstack_compute_secgroup_v2.sg_B.id}"
  }
}

# Security group B (dummy)
resource "openstack_compute_secgroup_v2" "sg_B" {
  name        = "sg_B"
  description = "Security Group B"
}
