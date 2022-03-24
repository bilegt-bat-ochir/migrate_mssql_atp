# migrate_to_atp
Hello Folks! Welcome to migrate to autonomous database lab.

In this lab we will migrate a mssql database to an Autonomous database in Oracle Cloud Infrastructure. We will use Oracle Goldengate for migration steps, and all of our services will be hosted in OCI for this lab purpose. 

# LAB 1

In this first lab, we will prepare our work environment and create our lab resources using Terraform script.

```
git clone https://github.com/hol-workshop/migrate_mssql_atp.git

cd migrate_mssql_atp
```

![](/files/1.Git.PNG)


Now we need to create a file to help terraform understanding your environment. Let's modify following parameters in your notepad and copy it.

```
tenancy_ocid  = "your_tenancy_value_here"
ssh_public_key  = "~/.ssh/oci.pub"
region = "your-region-value here"
compartment_ocid = "your-tenancy-value_here"
```

Enter below command in your current working migrate_to_atp directory:

**`vi terraform.tfvars`**

*This will create a new file, you have to press **i** key to enable editing, then "shift+insert" to paste copied parameter. When you are done editing press **:wq** keys then hit enter for save & quit.*

Good practice is, always keep it in your side notepad,

### Terraform

Now, time to play terraform. Run below command to download necessary terraform files from OCI provider.

```
terraform init
```

Plan and apply steps shouldn't ask any input from you. If it asks you to provide such as compartment_ocid, then again check previous files.

```
terraform plan

terraform apply --auto-approve
``` 

Make a copy of your output results in your notepad also for later use.

## Acknowledgements

* **Author** - Bilegt Bat-Ochir, Solution Engineer

