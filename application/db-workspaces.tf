// register cross-account ARN
resource "databricks_mws_credentials" "this" {
  provider         = databricks.mws
  account_id       = var.databricks_account_id
  credentials_name = "${var.environment}-creds"
  role_arn         = var.crossaccount_arn
}

// register root bucket
resource "databricks_mws_storage_configurations" "this" {
  provider                   = databricks.mws
  account_id                 = var.databricks_account_id
  storage_configuration_name = "${var.environment}-storage"
  bucket_name                = var.root_bucket
}

// register VPC
resource "databricks_mws_networks" "this" {
  provider           = databricks.mws
  account_id         = var.databricks_account_id
  network_name       = "${var.environment}-network"
  vpc_id             = var.vpc_id
  subnet_ids         = var.subnets_private
  security_group_ids = [var.security_group]
}

// create workspace in given VPC with DBFS on root bucket
resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = var.databricks_account_id
  workspace_name = "${var.environment}-databricks-workspace"
  aws_region     = var.region

  credentials_id           = databricks_mws_credentials.this.credentials_id
  storage_configuration_id = databricks_mws_storage_configurations.this.storage_configuration_id
  network_id               = databricks_mws_networks.this.network_id

  token {}
}