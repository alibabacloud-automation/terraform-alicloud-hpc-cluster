provider "alicloud" {
  region = "cn-hangzhou"
}

data "alicloud_instance_types" "default" {
  instance_type_family = "ecs.sccg7"
}

data "alicloud_images" "default" {
  name_regex = "^centos"
  instance_type = data.alicloud_instance_types.default.ids.0
}

locals {
  availability_zones = data.alicloud_instance_types.default.instance_types[0].availability_zones
}

resource "alicloud_security_group" "default" {
  name   = "tf-hpc-test"
  vpc_id = module.vpc.this_vpc_id
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_name           = "tf-hpc-test"
  vpc_cidr           = "172.16.0.0/16"
  vswitch_name       = "tf-hpc-test"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = local.availability_zones
}

module "example" {
  source = "../.."

  #alicloud_ecs_hpc_cluster
  create_cluster             = true
  cluster_name               = var.cluster_name
  cluster_description        = var.cluster_description
  #alicloud_instance
  create_instance            = true
  availability_zone          = local.availability_zones[0]
  instance_name              = var.instance_name
  security_group_ids         = [alicloud_security_group.default.id]
  vswitch_id                 = module.vpc.this_vswitch_ids[0]
  instance_type              = data.alicloud_instance_types.default.instance_types.0.id
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = var.system_disk_name
  system_disk_description    = var.system_disk_description
  image_id                   = data.alicloud_images.default.images.0.id
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  data_disks  = {
    name        = "data_disks_name"
    size        = 1200
    category    = "cloud_efficiency"
    description = "tf-test-description"
    encrypted   = true
  }
}