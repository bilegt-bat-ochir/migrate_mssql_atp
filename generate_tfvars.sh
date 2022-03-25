#!/bin/sh

var_tenancy_ocid=$( oci iam compartment list --access-level ACCESSIBLE |\
grep -i tenancy | \
awk 'NR==1{print $2}' | \
sed -e 's/,//g' -e 's/"//g')

var_region=$(printenv REGION)

function check_tenancy() {
 echo "tenancy_ocid = \"$var_tenancy_ocid\"" >> terraform.tfvars
}

function check_compartment() {
 echo "compartment_ocid = \"$var_tenancy_ocid\"" >> terraform.tfvars
}

function check_region() {
echo "region = \"$var_region\"" >> terraform.tfvars
}

check_tenancy
check_region
check_compartment
