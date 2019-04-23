# OpenStack Demo Infrastructure

Demonstration of IaaC (Infrastructure as a Code) automation for private or public OpenStack cloud.

This demonstration covers following:

* Stateful multi-region infrastructure management with Terraform, with a state in S3 bucket;
* Multi-region networking with Site to Site IPsec tunnels;
* Fully automated Site to Client VPN instances, based on OpenVPN;
* Multi-region supporting infrastructure provisioning with Ansible, Hashicorp Consul, Hashicorp Vault, and Graylog;
* CI/CD automation, with fully automated Concourse CI;
* Demonstration of how Traefik could do automatic letsencrypt validation;
* Vagrant setups for playgrounds;
* etc.

This code could be used as a starting point for those, who want to build their own IaaC,
for any sort of educational purposes, or just for copy and paste.
