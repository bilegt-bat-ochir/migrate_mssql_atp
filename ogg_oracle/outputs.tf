// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.

output "image_id" {
  value = oci_core_instance.vm.source_details[0].source_id
}

output "instance_id" {
  value = oci_core_instance.vm.id
}

output "ogg_oracle_Public_ip" {
  value = oci_core_instance.vm.public_ip
}
