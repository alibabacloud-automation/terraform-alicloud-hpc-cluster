locals {
  # Get ID of hpc cluster resources
  this_hpc_cluster_id = var.create_cluster ? concat(alicloud_ecs_hpc_cluster.cluster.*.id, [""])[0] : var.hpc_cluster_id
}