resource "openstack_vpnaas_ike_policy_v2" "ike_policy" {
  name                 = "Default ikev1 policy"
  encryption_algorithm = "aes-256"
  auth_algorithm       = "sha1"
  pfs                  = "group14"
}

resource "openstack_vpnaas_ipsec_policy_v2" "ipsec_policy" {
  name                 = "Default ipsec policy"
  encryption_algorithm = "aes-256"
  auth_algorithm       = "sha1"
  pfs                  = "group14"
}

output "ikepolicy_id" {
  value = "${openstack_vpnaas_ike_policy_v2.ike_policy.id}"
}

output "ipsecpolicy_id" {
  value = "${openstack_vpnaas_ipsec_policy_v2.ipsec_policy.id}"
}
