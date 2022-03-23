variable "cluster_name" {
  description = "The name of ECS Hpc Cluster."
  type        = string
  default     = "tf-test-name"
}

variable "cluster_description" {
  description = "The description of ECS Hpc Cluster."
  type        = string
  default     = "description"
}

#alicloud_instance
variable "instance_name" {
  description = "The name of ECS instance."
  type        = string
  default     = "tf-test-name"
}

variable "system_disk_name" {
  description = "The specification of the system disk name."
  type        = string
  default     = "tf-desk-name"
}

variable "system_disk_description" {
  description = "The specification of the system disk description."
  type        = string
  default     = "description"
}

variable "internet_max_bandwidth_out" {
  description = "The specification of the internet max bandwidth out."
  type        = number
  default     = 10
}

