// Migrate Postgresql to ATP lab materials

module "ogg_mssql_swap_block_volume" {
	source              = "./block_volume"
	compartment_ocid    = var.compartment_ocid
	availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
	size_in_gbs         = var.ogg_mssql_swap_size_in_gbs
	display_name        = "${var.ogg_mssql_bv_display_name} (Swap)"
}
module "ogg_mssql_trails_block_volume" {
	source              = "./block_volume"
	compartment_ocid    = var.compartment_ocid
	availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
	size_in_gbs         = var.ogg_mssql_trails_size_in_gbs
	display_name        = "${var.ogg_mssql_bv_display_name} (Trails)"
	existing_volume_id  = var.ogg_mssql_trails_volume_id
}
module "ogg_mssql_deployments_block_volume" {
	source              = "./block_volume"
	compartment_ocid    = var.compartment_ocid
	availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
	size_in_gbs         = var.ogg_mssql_deployments_size_in_gbs
	display_name        = "${var.ogg_mssql_bv_display_name} (Deployments)"
	existing_volume_id  = var.ogg_mssql_deployments_volume_id
}
module "ogg_mssql_cacheManager_block_volume" {
	source              = "./block_volume"
	compartment_ocid    = var.compartment_ocid
	availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
	size_in_gbs         = var.ogg_mssql_cacheManager_size_in_gbs
	display_name        = "${var.ogg_mssql_bv_display_name} (Deployments)"
	existing_volume_id  = var.ogg_mssql_cacheManager_volume_id
}
module "ogg_mssql_image" {
	source            = "./ogg_mssqlimage"
	compartment_ocid  = var.image_compartment_id
	market_image_id   = local.mp_listing_resource_id2
	custom_image_name = "ogg-${var.ogg_mssql_version}-${var.ogg_mssql_edition}-${var.ogg_mssql_dbms}"
}

module "ogg_mssql_compute" {
	source                	= "./ogg_mssql"
	deployments            = ("[ {\"name\":\"${var.ogg_mssql_deployment_name}\"} ]")
	compartment_id      	= var.compartment_ocid
	availability_domain   	= data.oci_identity_availability_domains.ads.availability_domains[0].name
	ssh_public_key			= file("~/.ssh/oci.pub")
	boot_size_in_gbs      	= var.ogg_mssql_boot_size_in_gbs
	display_name          	= var.ogg_mssql_display_name
	hostname_label        	= var.ogg_mssql_hostname_label
	compute_shape         	= var.ogg_mssql_compute_shape
	image_id              	= module.ogg_mssql_image.image_id
	swap_volume_id        	= module.ogg_mssql_swap_block_volume.volume_id
	trails_volume_id      	= module.ogg_mssql_trails_block_volume.volume_id
	deployments_volume_id 	= module.ogg_mssql_deployments_block_volume.volume_id
	cacheManager_volume_id 	= module.ogg_mssql_cacheManager_block_volume.volume_id
	subnet_id             	= oci_core_subnet.holvcn_public_subnet.id
	assign_public_ip      	= var.ogg_mssql_assign_public_ip
}

module "atp" {
	source          = "./atp"
	compartment_id  = var.compartment_ocid
	display_name 	= var.atp_display_name
	db_name         = "hol${random_string.deploy_id.result}"
	db_workload  	= var.atp_workload
	is_free_tier	= var.atp_is_free_tier
	db_version 		= var.atp_db_version
	cpu_core_count	= var.atp_ocpu_count
	data_storage_size_in_tbs 	= var.atp_storage_size
	license_model	= var.atp_license_model
	generate_type	= var.atp_wallet_generate_type
}

module "ogg_oracle_swap_block_volume" {
	source              = "./block_volume"
	compartment_ocid    = var.compartment_ocid
	availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
	size_in_gbs         = var.ogg_oracle_swap_size_in_gbs
	display_name        = "${var.ogg_oracle_bv_display_name} (Swap)"
}

module "ogg_oracle_trails_block_volume" {
	source              = "./block_volume"
	compartment_ocid    = var.compartment_ocid
	availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
	size_in_gbs         = var.ogg_oracle_trails_size_in_gbs
	display_name        = "${var.ogg_oracle_bv_display_name} (Trails)"
	existing_volume_id  = var.ogg_oracle_trails_volume_id
}

module "ogg_oracle_deployments_block_volume" {
	source              = "./block_volume"
	compartment_ocid    = var.compartment_ocid
	availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
	size_in_gbs         = var.ogg_oracle_deployments_size_in_gbs
	display_name        = "${var.ogg_oracle_bv_display_name} (Deployments)"
	existing_volume_id  = var.ogg_oracle_deployments_volume_id
}

module "ogg_oracle_cacheManager_block_volume" {
	source              = "./block_volume"
	compartment_ocid    = var.compartment_ocid
	availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
	size_in_gbs         = var.ogg_oracle_cacheManager_size_in_gbs
	display_name        = "${var.ogg_oracle_bv_display_name} (Cache Manager)"
	existing_volume_id  = var.ogg_oracle_cacheManager_volume_id
}
module "ogg_oracle_image" {
	source            = "./ogg_oracleimage"
	compartment_id    = var.image_compartment_id
	market_image_id   = local.mp_listing_resource_id
	custom_image_name = "ogg-${var.ogg_oracle_version}-${var.ogg_oracle_edition}-${var.ogg_oracle_dbms}"
}
module "ogg_oracle_compute" {
	depends_on 		= [module.atp]
	source           = "./ogg_oracle"
	deployments            = ("[ {\"name\":\"${var.ogg_oracle_deployment_name}\"} ]")
  	deployment_adb_wallet = module.atp.wallet
  	compartment_id        = var.compartment_ocid
  	availability_domain   = data.oci_identity_availability_domains.ads.availability_domains[0].name
  	ssh_public_key        = file("~/.ssh/oci.pub")
  	boot_size_in_gbs      = var.ogg_oracle_boot_size_in_gbs
  	display_name          = var.ogg_oracle_display_name
  	hostname_label        = var.ogg_oracle_hostname_label
  	compute_shape         = var.ogg_oracle_compute_shape
  	image_id              = module.ogg_oracle_image.image_id
  	swap_volume_id        = module.ogg_oracle_swap_block_volume.volume_id
  	trails_volume_id      = module.ogg_oracle_trails_block_volume.volume_id
  	deployments_volume_id = module.ogg_oracle_deployments_block_volume.volume_id
  	cacheManager_volume_id = module.ogg_oracle_cacheManager_block_volume.volume_id
  	subnet_id             = oci_core_subnet.holvcn_public_subnet.id
  	assign_public_ip      = var.ogg_oracle_assign_public_ip
}


output "ATP_generated_password" {
  value = module.atp.ATP_generated_password
}
output "OGG_ORACLE_PUBLIC_IP" {
  value = module.ogg_oracle_compute.ogg_oracle_Public_ip
}
output "OGG_MSSQL_PUBLIC_IP" {
  value = module.ogg_mssql_compute.ogg_mssql_Public_ip
}


