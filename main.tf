resource "alicloud_ecs_hpc_cluster" "cluster" {
  count       = var.create_cluster ? 1 : 0
  name        = var.cluster_name
  description = var.cluster_description
}

resource "alicloud_instance" "instance" {
  count                      = var.create_instance ? 1 : 0
  hpc_cluster_id             = local.this_hpc_cluster_id
  availability_zone          = var.availability_zone
  instance_name              = var.instance_name
  security_groups            = var.security_group_ids
  vswitch_id                 = var.vswitch_id
  instance_type              = var.instance_type
  system_disk_category       = var.system_disk_category
  system_disk_name           = var.system_disk_name
  system_disk_description    = var.system_disk_description
  image_id                   = var.image_id
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  data_disks {
    name        = lookup(var.data_disks, "name", null)
    size        = lookup(var.data_disks, "size", null)
    category    = lookup(var.data_disks, "category", "cloud_efficiency")
    description = lookup(var.data_disks, "description", null)
    encrypted   = lookup(var.data_disks, "encrypted", false)
  }
}