module "bas" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp-bas?ref=v1.0.1"

  db_archive_storage_class = var.rwx_storage_class
  dbpassword = var.bas_dbpassword
  dbuser = var.bas_dbuser
  default_storage_class = var.rwo_storage_class
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  grafanapassword = var.bas_grafanapassword
  grafanauser = var.bas_grafanauser
  kafka_storage_class = var.rwo_storage_class
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.bas-namespace.name
  postgres_storage_class = var.rwo_storage_class
  server_name = module.gitops_repo.server_name
  zookeeper_storage_class = var.rwo_storage_class
}
module "bas-namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.11.1"

  argocd_namespace = var.bas-namespace_argocd_namespace
  ci = var.bas-namespace_ci
  create_operator_group = var.bas-namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.bas-namespace_name
  server_name = module.gitops_repo.server_name
}
module "gitops_repo" {
  source = "github.com/cloud-native-toolkit/terraform-tools-gitops?ref=v1.15.3"

  branch = var.gitops_repo_branch
  gitops_namespace = var.gitops_repo_gitops_namespace
  host = var.gitops_repo_host
  org = var.gitops_repo_org
  public = var.gitops_repo_public
  repo = var.gitops_repo_repo
  sealed_secrets_cert = var.gitops_repo_sealed_secrets_cert
  server_name = var.gitops_repo_server_name
  strict = var.gitops_repo_strict
  token = var.gitops_repo_token
  type = var.gitops_repo_type
  username = var.gitops_repo_username
}
module "gitops-cp-catalogs" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp-catalogs?ref=v1.2.1"

  entitlement_key = var.entitlement_key
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = var.gitops-cp-catalogs_namespace
  server_name = module.gitops_repo.server_name
}
module "gitops-cp-maximo" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp-maximo?ref=v1.0.5"

  catalog_name = module.gitops-cp-catalogs.catalog_ibmoperators
  certmgr_namespace = var.gitops-cp-maximo_certmgr_namespace
  cluster_ingress = var.cluster_ingress
  entitlement_key = var.entitlement_key
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  instanceid = var.gitops-cp-maximo_instanceid
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  server_name = module.gitops_repo.server_name
  versionid = var.gitops-cp-maximo_versionid
}
module "gitops-mongo-ce" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-mongo-ce?ref=v1.1.3"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  mongo_version = var.gitops-mongo-ce_mongo_version
  namespace = module.gitops-mongo-ce-operator.namespace
  password = var.gitops-mongo-ce_password
  port = var.gitops-mongo-ce_port
  replicaset_count = var.gitops-mongo-ce_replicaset_count
  server_name = module.gitops_repo.server_name
  service_name = var.gitops-mongo-ce_service_name
  storage_class_name = var.rwo_storage_class
}
module "gitops-mongo-ce-operator" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-mongo-ce-operator?ref=v1.0.4"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  mongo_password = var.gitops-mongo-ce-operator_mongo_password
  mongo_serviceaccount = var.gitops-mongo-ce-operator_mongo_serviceaccount
  mongo_storageclass = var.rwo_storage_class
  mongo_version = var.gitops-mongo-ce-operator_mongo_version
  namespace = module.mongo-namespace.name
  server_name = module.gitops_repo.server_name
}
module "maximo-namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.11.1"

  argocd_namespace = var.maximo-namespace_argocd_namespace
  ci = var.maximo-namespace_ci
  create_operator_group = var.maximo-namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.maximo-namespace_name
  server_name = module.gitops_repo.server_name
}
module "mongo-namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.11.1"

  argocd_namespace = var.mongo-namespace_argocd_namespace
  ci = var.mongo-namespace_ci
  create_operator_group = var.mongo-namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.mongo-namespace_name
  server_name = module.gitops_repo.server_name
}
module "sls" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp-sls?ref=v2.2.1"

  catalog = module.gitops-cp-catalogs.catalog_ibmoperators
  catalog_namespace = var.sls_catalog_namespace
  channel = var.sls_channel
  cluster_ingress = var.cluster_ingress
  entitlement_key = var.entitlement_key
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  mongo_cacrt = module.gitops-mongo-ce.cacrt
  mongo_dbpass = module.gitops-mongo-ce.password
  mongo_namespace = module.gitops-mongo-ce.namespace
  mongo_port = module.gitops-mongo-ce.port
  mongo_svcname = module.gitops-mongo-ce.svcname
  mongo_userid = module.gitops-mongo-ce.username
  namespace = module.sls-namespace.name
  server_name = module.gitops_repo.server_name
}
module "sls-namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.11.1"

  argocd_namespace = var.sls-namespace_argocd_namespace
  ci = var.sls-namespace_ci
  create_operator_group = var.sls-namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.sls-namespace_name
  server_name = module.gitops_repo.server_name
}
module "util-clis" {
  source = "cloud-native-toolkit/clis/util"
  version = "1.9.5"

  bin_dir = var.util-clis_bin_dir
  clis = var.util-clis_clis == null ? null : jsondecode(var.util-clis_clis)
}
