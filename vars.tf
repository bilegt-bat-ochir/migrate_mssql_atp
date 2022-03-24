variable "tenancy_ocid" {}
variable "region" {}
variable "compartment_ocid" {}

################################ Quotas

variable "ogg_mssql_compute_shape" {
  default = "VM.Standard2.1"
}
variable "ogg_oracle_compute_shape" {
  default = "VM.Standard2.1"
}
################################ VCN

variable "holvcn_display_name" {
  default = "HOLVCN"
}
variable "holvcn_dns_label" {
  default = "holvcn"
}
variable "holvcn_public_subnet_display_name" {
  default = "HOLVCN_Public_Subnet"
}
variable "holvcn_public_security_list_display_name" {
  default = "HOLVCN_Public_SL"
}
variable "holvcn_public_dns_label" {
  default = "holvcnpublc"
}
variable "holvcn_public_route_table_display_name" {
  default = "HOLVCN_Public_RT"
}
variable "holvcn_private_subnet_display_name" {
  default = "HOLVCN_Private_subnet"
}
variable "holvcn_private_security_list_display_name" {
  default = "HOLVCN_Private_SL"
}
variable "holvcn_private_dns_label" {
  default = "holvcnprivate"
}
variable "holvcn_private_route_table_display_name" {
  default = "HOLVCN_Private_RT"
}
variable "holvcn_igw_display_name" {
  default = "HOLVCN_IGW"
}
variable "holvcn_nat_display_name" {
  default = "HOLVCN_IGW"
}
variable "holvcn_cidr_block" {
  default = "10.10.0.0/16"
}
variable "holvcn_public_cidr_block" {
  default = "10.10.0.0/24"
}
variable "holvcn_private_cidr_block" {
  default = "10.10.1.0/24"
}
variable "holvcn_igw_cidr_block" {
  default = "0.0.0.0/0"
}
variable "holvcn_nat_cidr_block" {
  default = "0.0.0.0/0"
}

################################ TARGET ATP
variable "atp_display_name" {
  default = "HOL Target ATP"
}
variable "atp_db_name" {
  default = "hol"
}
variable "atp_db_version" {
  default = "19c"
}
variable "atp_license_model" {
  default = "LICENSE_INCLUDED"
}
## FREE TIER
variable "atp_is_free_tier" {
  default = false
}
variable "atp_ocpu_count" {
  default = 1
}
variable "atp_storage_size" {
  default = 1
}
variable "atp_visibility" {
  default = "Public"
}
variable "atp_wallet_generate_type" {
  default = "SINGLE"
}
variable "atp_workload" {
  default = "OLTP"
}
variable "database_id" {
  default = ""
}

################################ OGG MSSQL BLOCK VOLUME
//
variable "ogg_mssql_bv_display_name" {
  default = "ogg_mssql_BlockVolume"
}
variable "boot_size_in_gbs" {
  default = "50"
}
variable "ogg_mssql_swap_size_in_gbs" {
  default = "50" //256
}
variable "ogg_mssql_trails_size_in_gbs" {
  default = "50" //512
}
variable "ogg_mssql_deployments_size_in_gbs" {
  default = "50"
}
variable "ogg_mssql_cacheManager_size_in_gbs" {
  default = "50" //256
}
// OGG Deployment volume
variable "ogg_mssql_deployments_volume_id" {
  default = ""
}
// OGG Cache Manager volume
variable "ogg_mssql_cacheManager_volume_id" {
  default = ""
}
// OGG Trails volume
variable "ogg_mssql_trails_volume_id" {
  default = ""
}
################################ OGG ORACLE BLOCK VOLUME
//
variable "ogg_oracle_bv_display_name" {
  default = "ogg_oracle_BlockVolume"
}

variable "ogg_oracle_swap_size_in_gbs" {
  default = "50"  //256
}
variable "ogg_oracle_trails_size_in_gbs" {
  default = "50"  //512
}
variable "ogg_oracle_deployments_size_in_gbs" {
  default = "50"
}
variable "ogg_oracle_cacheManager_size_in_gbs" {
  default = "50" //256
}
// OGG Deployment volume
variable "ogg_oracle_deployments_volume_id" {
  default = ""
}
// OGG CacheManager volume
variable "ogg_oracle_cacheManager_volume_id" {
  default = ""
}
// OGG Trails volume
variable "ogg_oracle_trails_volume_id" {
  default = ""
}
################################ OGG MSSQL IMAGE
variable "ogg_mssql_dbms" {
  default = "SQLServer"
}
variable "ogg_mssql_edition" {
  default = "Microservices"
}
variable "ogg_mssql_version" {
  default = "21.5.0.0.2"
}
variable "image_compartment_id" {
  default = ""
}
################################ OGG MSSQL INSTANCE
variable "ogg_mssql_assign_public_ip" {
  default = true
}
variable "ogg_mssql_boot_size_in_gbs" {
  default = "50"
}
variable "ogg_mssql_display_name" {
  default = "GG Microservices MSSQL 21.5"
}
variable "ogg_mssql_hostname_label" {
  default = "ogg21cmssql"
}
variable "ogg_mssql_custom_volume_sizes" {
  default = false
}
################################ OGG ORACLE IMAGE
variable "ogg_oracle_dbms" {
  default = "Oracle"
}
variable "ogg_oracle_edition" {
  default = "Microservices"
}
variable "ogg_oracle_version" {
  default = "21.5.0.0.2"
}
################################ OGG ORACLE INSTANCE
variable "ogg_oracle_assign_public_ip" {
  default = true
}
variable "ogg_oracle_boot_size_in_gbs" {
  default = "50"
}
variable "ogg_oracle_display_name" {
  default = "GG Microservices ORACLE21.5"
}
variable "ogg_oracle_hostname_label" {
  default = "ogg21cora"
}
variable "ogg_oracle_custom_volume_sizes" {
  default = false
}
################################ OGG ORACLE DEPLOYMENTS

variable "deployments_json" {
  default = ""
}

variable "deployment_name" {
  default = ""
}

variable "deployment_adb" {
  default = false
}

variable "deployment_adb_compartment_id" {
  default = ""
}

variable "deployment_adb_id" {
  default = ""
}