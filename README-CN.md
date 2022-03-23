Terraform Module for creating ECS HPC cluster on Alibaba Cloud.

terraform-alicloud-hpc-cluster
=====================================================================

[English](README.md) | 简体中文

本 Module 用于在阿里云创建高性能集群（E-HPC）。

本 Module 支持创建以下资源:

* [alicloud_ecs_hpc_cluster](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ecs_hpc_cluster)
* [alicloud_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/instance)

## 用法

```hcl
module "example" {
  source                     = "terraform-alicloud-modules/hpc-cluster/alicloud"
  #alicloud_ecs_hpc_cluster
  create_cluster             = true
  cluster_name               = "tf-name"
  #alicloud_instance
  create_instance            = true
  availability_zone          = "cn-hangzhou-k"
  instance_name              = "tf-test-name"
  security_group_ids         = ["sg-123456xxx"]
  vswitch_id                 = "vsw-123456xxx"
  instance_type              = "ecs.sccg7.32xlarge"
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = "tf-system_disk_name"
  system_disk_description    = "system_disk_description"
  image_id                   = "centos_7_9_uefi_x64_20G_scc_20210727.vhd"
  internet_max_bandwidth_out = 50
  data_disks  = {
    name        = "data_disks_name"
    size        = 120
    category    = "cloud_efficiency"
    description = "tf-test-description"
    encrypted   = true
  }
}
```

## 示例

* [Clickhouse 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-hpc-cluster/tree/main/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.116.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.116.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
