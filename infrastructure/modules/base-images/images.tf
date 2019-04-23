resource "openstack_images_image_v2" "bionic" {
  name             = "Original Ubuntu Bionic 18.04 LTS"
  image_source_url = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
  container_format = "bare"
  disk_format      = "qcow2"
}

resource "openstack_images_image_v2" "xenial" {
  name             = "Original Ubuntu Xenial 16.04 LTS"
  image_source_url = "https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img"
  container_format = "bare"
  disk_format      = "qcow2"
}

resource "openstack_images_image_v2" "cosmic" {
  name             = "Original Ubuntu Cosmic 18.10"
  image_source_url = "https://cloud-images.ubuntu.com/cosmic/current/cosmic-server-cloudimg-amd64.img"
  container_format = "bare"
  disk_format      = "qcow2"
}

resource "openstack_images_image_v2" "centos" {
  name             = "Original CentOS 7 Generic Cloud"
  image_source_url = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
  container_format = "bare"
  disk_format      = "qcow2"
}

output "bionic_id" {
  value = "${openstack_images_image_v2.bionic.id}"
}

output "xenial_id" {
  value = "${openstack_images_image_v2.xenial.id}"
}

output "centos_id" {
  value = "${openstack_images_image_v2.centos.id}"
}
