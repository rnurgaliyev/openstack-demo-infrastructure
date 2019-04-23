resource "openstack_compute_secgroup_v2" "concourse_web" {
  name        = "concourse_web"
  description = "Security Group for Concourse CI web"
}

resource "openstack_networking_secgroup_rule_v2" "icmp_to_concourse_web" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_compute_secgroup_v2.concourse_web.id}"
}

resource "openstack_networking_secgroup_rule_v2" "ssh_to_concourse_web" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_compute_secgroup_v2.concourse_web.id}"
}

resource "openstack_networking_secgroup_rule_v2" "http_to_concourse_web" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_compute_secgroup_v2.concourse_web.id}"
}

resource "openstack_networking_secgroup_rule_v2" "https_to_concourse_web" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_compute_secgroup_v2.concourse_web.id}"
}

resource "openstack_networking_secgroup_rule_v2" "concourse_workers_to_tsa" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_group_id   = "${openstack_compute_secgroup_v2.concourse_worker.id}"
  security_group_id = "${openstack_compute_secgroup_v2.concourse_web.id}"
}

resource "openstack_compute_secgroup_v2" "concourse_worker" {
  name        = "concourse_worker"
  description = "Security Group for Concourse CI worker"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port     = 1
    to_port       = 65535
    ip_protocol   = "tcp"
    from_group_id = "${openstack_compute_secgroup_v2.concourse_web.id}"
  }

  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}
