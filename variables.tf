variable "create_cluster" {
  description = "Controls if Hpc cluster should be created"
  type        = bool
  default     = false
}

variable "hpc_cluster_id" {
  description = "The id of Hpc cluster.It will be ignored when create_cluster = true"
  type        = string
  default     = ""
}

variable "cluster_name" {
  description = "The name of ECS Hpc Cluster."
  type        = string
  default     = ""
}

variable "cluster_description" {
  description = "The description of ECS Hpc Cluster."
  type        = string
  default     = ""
}

#alicloud_instance
variable "create_instance" {
  description = "Controls if instance should be created"
  type        = bool
  default     = false
}

variable "availability_zone" {
  description = "The available zone to launch modules."
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "The name of ECS instance."
  type        = string
  default     = ""
}

variable "security_group_ids" {
  description = "A list of security group ids to associate with."
  type        = list(string)
  default     = []
}

variable "vswitch_id" {
  description = "VSwitch variables, if vswitch_id is empty, then the net_type = classic."
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The specification of the instance type."
  type        = string
  default     = ""
}

variable "system_disk_category" {
  description = "The specification of the system disk category."
  type        = string
  default     = "cloud_efficiency"
}

variable "system_disk_name" {
  description = "The specification of the system disk name."
  type        = string
  default     = ""
}

variable "system_disk_description" {
  description = "The specification of the system disk description."
  type        = string
  default     = ""
}

variable "image_id" {
  description = "The specification of the image id."
  type        = string
  default     = ""
}

variable "internet_max_bandwidth_out" {
  description = "The specification of the internet max bandwidth out."
  type        = number
  default     = 10
}

variable "data_disks" {
  description = "The list of data disks created with instance."
  type        = map(string)
  default     = {}
}

