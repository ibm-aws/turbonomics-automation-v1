module "aws-vpc" {
  source = "github.com/cloud-native-toolkit/terraform-aws-vpc?ref=v1.3.0"

  enable_dns_hostnames = var.aws-vpc_enable_dns_hostnames
  enable_dns_support = var.aws-vpc_enable_dns_support
  external_cidr = var.aws-vpc_external_cidr
  instance_tenancy = var.aws-vpc_instance_tenancy
  internal_cidr = var.aws-vpc_internal_cidr
  name = var.aws-vpc_name
  name_prefix = var.name_prefix
  number_subnets_vpn = var.aws-vpc_number_subnets_vpn
  provision = var.aws-vpc_provision
  resource_group_name = var.resource_group_name
  vpn_endpoint_id = var.aws-vpc_vpn_endpoint_id
  vpn_subnets_id = var.aws-vpc_vpn_subnets_id == null ? null : jsondecode(var.aws-vpc_vpn_subnets_id)
}
module "internet_gateway" {
  source = "github.com/cloud-native-toolkit/terraform-aws-vpc-gateways?ref=v1.2.0"

  name = var.internet_gateway_name
  name_prefix = var.name_prefix
  provision = var.internet_gateway_provision
  resource_group_name = var.resource_group_name
  vpc_name = module.aws-vpc.vpc_name
}
module "nat_gateway" {
  source = "github.com/cloud-native-toolkit/terraform-aws-nat-gateway?ref=v1.1.0"

  _count = var.nat_gateway__count
  allocation_id = var.nat_gateway_allocation_id
  connectivity_type = var.nat_gateway_connectivity_type
  name = var.nat_gateway_name
  name_prefix = var.nat_gateway_name_prefix
  provision = var.nat_gateway_provision
  resource_group_name = var.nat_gateway_resource_group_name
  subnet_ids = module.public_subnets.subnet_ids
}
module "private_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-aws-vpc-subnets?ref=v2.1.2"

  acl_rules = var.private_subnets_acl_rules == null ? null : jsondecode(var.private_subnets_acl_rules)
  availability_zones = var.private_subnets_availability_zones == null ? null : jsondecode(var.private_subnets_availability_zones)
  customer_owned_ipv4_pool = var.private_subnets_customer_owned_ipv4_pool
  gateways = module.nat_gateway.ids
  label = var.private_subnets_label
  map_customer_owned_ip_on_launch = var.private_subnets_map_customer_owned_ip_on_launch
  map_public_ip_on_launch = var.private_subnets_map_public_ip_on_launch
  name_prefix = var.private_subnets_name_prefix
  provision = var.private_subnets_provision
  resource_group_name = var.private_subnets_resource_group_name
  subnet_cidrs = var.private_subnets_subnet_cidrs == null ? null : jsondecode(var.private_subnets_subnet_cidrs)
  vpc_name = module.aws-vpc.vpc_name
}
module "public_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-aws-vpc-subnets?ref=v2.1.2"

  acl_rules = var.public_subnets_acl_rules == null ? null : jsondecode(var.public_subnets_acl_rules)
  availability_zones = var.public_subnets_availability_zones == null ? null : jsondecode(var.public_subnets_availability_zones)
  customer_owned_ipv4_pool = var.public_subnets_customer_owned_ipv4_pool
  gateways = module.internet_gateway.ids
  label = var.public_subnets_label
  map_customer_owned_ip_on_launch = var.public_subnets_map_customer_owned_ip_on_launch
  map_public_ip_on_launch = var.public_subnets_map_public_ip_on_launch
  name_prefix = var.public_subnets_name_prefix
  provision = var.public_subnets_provision
  resource_group_name = var.public_subnets_resource_group_name
  subnet_cidrs = var.public_subnets_subnet_cidrs == null ? null : jsondecode(var.public_subnets_subnet_cidrs)
  vpc_name = module.aws-vpc.vpc_name
}
module "rosa-cluster" {
  source = "github.com/cloud-native-toolkit/terraform-aws-rosa?ref=v1.1.0"

  cluster_name = var.rosa-cluster_cluster_name
  compute-machine-type = var.rosa-cluster_compute-machine-type
  dry_run = var.rosa-cluster_dry_run
  etcd-encryption = var.rosa-cluster_etcd-encryption
  existing_vpc = var.rosa-cluster_existing_vpc
  host-prefix = var.rosa-cluster_host-prefix
  machine-cidr = var.rosa-cluster_machine-cidr
  multi-zone-cluster = var.rosa-cluster_multi-zone-cluster
  name_prefix = var.rosa-cluster_name_prefix
  no_of_compute_nodes = var.rosa-cluster_no_of_compute_nodes
  ocp_version = var.rosa-cluster_ocp_version
  pod-cidr = var.rosa-cluster_pod-cidr
  private_subnet_ids = module.private_subnets.subnet_ids
  private-link = var.rosa-cluster_private-link
  public_subnet_ids = module.public_subnets.subnet_ids
  region = var.rosa-cluster_region
  rosa_token = var.rosa-cluster_rosa_token
  service-cidr = var.rosa-cluster_service-cidr
  subnet_ids = var.rosa-cluster_subnet_ids == null ? null : jsondecode(var.rosa-cluster_subnet_ids)
}
