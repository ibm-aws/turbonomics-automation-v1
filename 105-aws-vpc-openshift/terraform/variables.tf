variable "aws-vpc_name" {
  type = string
  description = "The name of the VPC instance"
  default = "ascent-cfn-vpc"
}
variable "aws-vpc_internal_cidr" {
  type = string
  description = "The cidr range of the internal network for the AWS VPC. Either provide manually or chose from AWS IPAM poolsß"
  default = "10.0.0.0/16"
}
variable "aws-vpc_external_cidr" {
  type = string
  description = "The cidr range of the external network for the AWS VPC."
  default = "0.0.0.0/0"
}
variable "aws-vpc_provision" {
  type = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default = true
}
variable "aws-vpc_instance_tenancy" {
  type = string
  description = "Instance is shared / dedicated, etc. #[default, dedicated, host]"
  default = "default"
}
variable "name_prefix" {
  type = string
  description = "Prefix to be added to the names of resources which are being provisioned"
  default = "swe"
}
variable "aws-vpc_enable_dns_support" {
  type = string
  description = "default is true. [true, false]]"
  default = "true"
}
variable "aws-vpc_enable_dns_hostnames" {
  type = string
  description = "Default is false. [true, false]]. Set to true for ROSA cluster"
  default = "true"
}
variable "resource_group_name" {
  type = string
  description = "The name of the resource group where the VPC is deployed. On AWS this value becomes a tag."
  default = "ascent-cfn"
}
variable "aws-vpc_number_subnets_vpn" {
  type = number
  description = "list if subnets to attch with vpn"
  default = 0
}
variable "aws-vpc_vpn_endpoint_id" {
  type = string
  description = "The vpn client endpoint."
  default = ""
}
variable "aws-vpc_vpn_subnets_id" {
  type = string
  description = "id of associated subnets with vpn client service"
  default = null
}
variable "region" {
  type = string
  description = "the value of region"
}
variable "access_key" {
  type = string
  description = "the value of access_key"
}
variable "secret_key" {
  type = string
  description = "the value of secret_key"
}
variable "internet_gateway_name" {
  type = string
  description = "The name of the IGW instance"
  default = "ascent-cfn-gateway"
}
variable "internet_gateway_provision" {
  type = bool
  description = "Flag to determine whether to provision Internet gateway or not. Defautl set to true"
  default = true
}
variable "public_subnets_provision" {
  type = bool
  description = "Provision Subnet if  true."
  default = true
}
variable "public_subnets_resource_group_name" {
  type = string
  description = "The name of the resource group where the VPC is deployed. On AWS this value becomes a tag."
  default = "ascent"
}
variable "public_subnets_name_prefix" {
  type = string
  description = "Prefix to be added to the names of resources which are being provisioned"
  default = "swe-ascent"
}
variable "public_subnets_label" {
  type = string
  description = "label to define type of subnet"
  default = "public"
}
variable "public_subnets_subnet_cidrs" {
  type = string
  description = "(Required) The CIDR block for the  subnet."
  default = "[\"10.0.1.0/24\",\"10.0.2.0/24\",\"10.0.3.0/24\"]"
}
variable "public_subnets_availability_zones" {
  type = string
  description = "List of availability zone ids"
  default = "[\"us-east-2a\",\"us-east-2b\",\"us-east-2c\"]"
}
variable "public_subnets_customer_owned_ipv4_pool" {
  type = string
  description = "Type of the subnet: Public / Private"
  default = ""
}
variable "public_subnets_map_customer_owned_ip_on_launch" {
  type = string
  description = "Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and  arguments must be specified when set to true. Default is false."
  default = "false"
}
variable "public_subnets_map_public_ip_on_launch" {
  type = string
  description = "(Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is fals"
  default = "true"
}
variable "public_subnets_acl_rules" {
  type = string
  description = "the value of public_subnets_acl_rules"
  default = "[{\"rule_number\":\"100\",\"protocol\":\"all\",\"action\":\"allow\",\"cidr_block\":\"0.0.0.0/0\",\"from_port\":\"443\",\"to_port\":\"443\",\"rule_action\":\"allow\",\"egress\":\"true\"}, {\"rule_number\":\"100\",\"protocol\":\"all\",\"action\":\"allow\",\"cidr_block\":\"0.0.0.0/0\",\"from_port\":\"443\",\"to_port\":\"443\",\"rule_action\":\"allow\",\"egress\":\"false\"}]"
}
variable "private_subnets_provision" {
  type = bool
  description = "Provision Subnet if  true."
  default = true
}
variable "private_subnets_resource_group_name" {
  type = string
  description = "The name of the resource group where the VPC is deployed. On AWS this value becomes a tag."
  default = "ascent"
}
variable "private_subnets_name_prefix" {
  type = string
  description = "Prefix to be added to the names of resources which are being provisioned"
  default = "swe-ascent"
}
variable "private_subnets_label" {
  type = string
  description = "label to define type of subnet"
  default = "private"
}
variable "private_subnets_subnet_cidrs" {
  type = string
  description = "(Required) The CIDR block for the  subnet."
  default = "[\"10.0.4.0/24\",\"10.0.5.0/24\",\"10.0.6.0/24\"]"
}
variable "private_subnets_availability_zones" {
  type = string
  description = "List of availability zone ids"
  default = "[\"us-east-2a\",\"us-east-2b\",\"us-east-2c\"]"
}
variable "private_subnets_customer_owned_ipv4_pool" {
  type = string
  description = "Type of the subnet: Public / Private"
  default = ""
}
variable "private_subnets_map_customer_owned_ip_on_launch" {
  type = string
  description = "Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and  arguments must be specified when set to true. Default is false."
  default = "false "
}
variable "private_subnets_map_public_ip_on_launch" {
  type = string
  description = "(Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is fals"
  default = "false"
}
variable "private_subnets_acl_rules" {
  type = string
  description = "the value of private_subnets_acl_rules"
  default = "[{\"rule_number\":\"100\",\"protocol\":\"all\",\"action\":\"allow\",\"cidr_block\":\"0.0.0.0/0\",\"from_port\":\"443\",\"to_port\":\"443\",\"rule_action\":\"allow\",\"egress\":\"true\"}, {\"rule_number\":\"100\",\"protocol\":\"all\",\"action\":\"allow\",\"cidr_block\":\"0.0.0.0/0\",\"from_port\":\"443\",\"to_port\":\"443\",\"rule_action\":\"allow\",\"egress\":\"false\"}]"
}
variable "nat_gateway_name" {
  type = string
  description = "The name of the NGW instance"
  default = "ascent-cfn-nat-gateway"
}
variable "nat_gateway_name_prefix" {
  type = string
  description = "Prefix to be added to the names of resources which are being provisioned"
  default = "swe"
}
variable "nat_gateway_resource_group_name" {
  type = string
  description = "The name of the resource group where the VPC is deployed. On AWS this value becomes a tag."
  default = "ascent"
}
variable "nat_gateway_provision" {
  type = bool
  description = "Flag to determine whether to provision Internet gateway or not. Defautl set to true"
  default = true
}
variable "nat_gateway__count" {
  type = number
  description = "Number of resources to be provisioned"
  default = 3
}
variable "nat_gateway_connectivity_type" {
  type = string
  description = "(Optional) Connectivity type for the gateway. Valid values are private and public. Defaults to public."
  default = "public"
}
variable "nat_gateway_allocation_id" {
  type = string
  description = "(Optional) The Allocation ID of the Elastic IP address for the gateway. Required for connectivity_type of public"
  default = ""
}
variable "rosa-cluster_name_prefix" {
  type = string
  description = "Prefix to be added to the names of resources which are being provisioned"
  default = "swe-ascentcfn"
}
variable "rosa-cluster_region" {
  type = string
  description = "Please set the region where the resouces to be created"
  default = "us-east-2"
}
variable "rosa-cluster_rosa_token" {
  type = string
  description = "get an offline access token at https://cloud.redhat.com/openshift/token/rosa "
  default = ""
}
variable "rosa-cluster_dry_run" {
  type = bool
  description = "Set to true to dry the command just to verify. Else set to false to actually run the cmd"
  default = false
}
variable "rosa-cluster_existing_vpc" {
  type = bool
  description = "Flag to identify if VPC already exists. Default set to true. Used to identify to pass the subnet ids to create the ROSA cluster"
  default = true
}
variable "rosa-cluster_cluster_name" {
  type = string
  description = "Name of the RedHat OpenShift Cluster"
  default = "ascent-rosa"
}
variable "rosa-cluster_ocp_version" {
  type = string
  description = "Version of OpenShift that will be used to install the cluster"
  default = "4.9.15"
}
variable "rosa-cluster_no_of_compute_nodes" {
  type = number
  description = "Number of worker nodes to be provisioned"
  default = 3
}
variable "rosa-cluster_compute-machine-type" {
  type = string
  description = "Instance type for the compute nodes. Determines the amount of memory and vCPU allocated to each compute node."
  default = "m5.4xlarge"
}
variable "rosa-cluster_machine-cidr" {
  type = string
  description = "ipNet Block of IP addresses used by OpenShift while installing the cluster, for example 10.0.0.0/16 "
  default = "10.0.0.0/16"
}
variable "rosa-cluster_service-cidr" {
  type = string
  description = "ipNet Block of IP addresses for services, for example 172.30.0.0/16 "
  default = "172.30.0.0/16"
}
variable "rosa-cluster_pod-cidr" {
  type = string
  description = "ipNet Block of IP addresses from which Pod IP addresses are allocated, for example 10.128.0.0/14 "
  default = "10.128.0.0/14"
}
variable "rosa-cluster_host-prefix" {
  type = number
  description = "Subnet prefix length to assign to each individual node. For example, if host prefix is set to 23, then each node is assigned a /23 subnet out of the given CIDR."
  default = 23
}
variable "rosa-cluster_etcd-encryption" {
  type = string
  description = "Add etcd encryption. By default etcd data is encrypted at rest. This option configures etcd encryption on top of existing storage encryption."
  default = ""
}
variable "rosa-cluster_subnet_ids" {
  type = string
  description = "To create cluster in existing VPC, public and private Subnet ids should be given ."
  default = "[\"\"]"
}
variable "rosa-cluster_multi-zone-cluster" {
  type = bool
  description = " Deploy to multiple data centers"
  default = true
}
variable "rosa-cluster_private-link" {
  type = bool
  description = "Provides private connectivity between VPCs, AWS services, and your on-premises networks, without exposing your traffic to the public internet"
  default = false
}
