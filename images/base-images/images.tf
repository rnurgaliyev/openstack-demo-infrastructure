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
