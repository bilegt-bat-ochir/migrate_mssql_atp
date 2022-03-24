// Copyright (c) 2021, Oracle and/or its affiliates.

output "image_id" {
  value = oci_core_instance.vm2.source_details[0].source_id
}

output "instance_id" {
  value = oci_core_instance.vm2.id
}

output "ogg_mssql_Public_ip" {
  value = oci_core_instance.vm2.public_ip
}
