output "hpc_cluster_id" {
  description = "The id of the ECS Hpc Cluster."
  value       = local.this_hpc_cluster_id
}

output "instance_id" {
  description = "The id of the ECS instance."
  value       = concat(alicloud_instance.instance.*.id, [""])[0]
}