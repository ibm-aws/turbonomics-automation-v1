# aws-portworx


### Description

Terraform module to install Portworx into an OCP/ROSA cluster on AWS, compatible with modules from https://modules.cloudnativetoolkit.dev

### Prerequisites

This module requires a Portworx configuration.   Portworx is available in 2 flavors: `Enterprise` and `Essentials`.   

*Portworx Essentials* is free forever, but only supports a maximum of 5 nodes on a cluster, 200 volumes, and 5TB of storage.   
*Portworx Enterprise* requires a subscription (has 30 day free trial), supports over 1000 nodes per cluster, and has unlimited storage.

More detailed comparisons are available at: https://portworx.com/products/features/

Instructions for obtaining your portworx configuration are available at:
- [Portworx Essentials](./PORTWORX_ESSENTIALS.md)
- [Portworx Enterprise](./PORTWORX_ENTERPRISE.md)

You can see an example in the [Example usage](#example-usage) section below.

### Software dependencies

The module depends on the following software components:

#### Command-line tools

- terraform >= v0.15

#### Terraform providers

- IBM Cloud provider >= 1.5.3

### Module dependencies

This module makes use of the output from other modules:

- Cluster - github.com/cloud-native-toolkit/terraform-ocp-login.git

### Example usage

```hcl-terraform
locals {
  portworx_config = {
    enable = true
    cluster_id = var.px_cluster_id
    user_id = var.px_user_id
    osb_endpoint = var.px_osb_endpoint
    type = "essentials"
    enable_encryption = false
  }
}

module "aws_portworx" {
  source = "./module"

  region                = var.region
  access_key            = var.access_key
  secret_key            = var.secret_key
  cluster_config_file   = module.dev_cluster.platform.kubeconfig
  portworx_config       = local.portworx_config
}

```

## Acknowledgements
This module is derivative from https://github.com/ibm-hcbt/terraform-ibm-cloud-pak/tree/main/modules/portworx_aws

