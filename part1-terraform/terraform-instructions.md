## Hands-on Session Part 1: A fresh start

### What do you need?

I assume you already have Terraform installed and an AWS credential with programatic access (`Access Key ID` and`Secret Access Key`). It is important that his user has the following policies:
- `AmazonEC2FullAccess`
- `AmazonS3FullAccess`

Confirm that you have Terraform with:

```
→ terraform --version
Terraform v0.11.7
```

Confirm that you have your AWS keys correctly setup with the AWS CLI:

```
→ aws configure list
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ****************ZQMQ shared-credentials-file
secret_key     ****************oOdv shared-credentials-file
    region                eu-west-1      config-file    ~/.aws/config
```

> We will deploy things on the default VPC and destroy afterwards... so be careful if your using your company's AWS CLI account.

> If you don't have the aws cli and no configuration on `~/.aws/credentials` you can just export the two variables on your current shell.

### A simple server with Terraform
Terraform code is written to `.tf` files using the HashiCorp Configuration Language (HCL). You are describing how you would like your infrastructure should be (as it is **declarative**) and Terraform will make it happen. 

The first file to create on the project folder is to `main.tf` and configure the provider (_check file_).

First `init` the plugins.
```
→ terraform init

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 1.23"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Check the changes that you will apply with a `plan` - this is a sanity check!

```
→ terraform plan

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + aws_instance.ibm-example
      id:                           <computed>
      ami:                          "ami-58d7e821"
      associate_public_ip_address:  <computed>
      availability_zone:            <computed>
      ebs_block_device.#:           <computed>
      ephemeral_block_device.#:     <computed>
      get_password_data:            "false"
      instance_state:               <computed>
      instance_type:                "t2.micro"
      ipv6_address_count:           <computed>
      ipv6_addresses.#:             <computed>
      key_name:                     <computed>
      network_interface.#:          <computed>
      network_interface_id:         <computed>
      password_data:                <computed>
      placement_group:              <computed>
      primary_network_interface_id: <computed>
      private_dns:                  <computed>
      private_ip:                   <computed>
      public_dns:                   <computed>
      public_ip:                    <computed>
      root_block_device.#:          <computed>
      security_groups.#:            <computed>
      source_dest_check:            "true"
      subnet_id:                    <computed>
      tenancy:                      <computed>
      volume_tags.%:                <computed>
      vpc_security_group_ids.#:     <computed>


Plan: 1 to add, 0 to change, 0 to destroy.
```
To actually create the resources that you see on the `plan` you must run `terraform apply`:

```
→ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + aws_instance.ibm-example
      id:                           <computed>
      ami:                          "ami-58d7e821"
      associate_public_ip_address:  <computed>
      availability_zone:            <computed>
      ebs_block_device.#:           <computed>
      ephemeral_block_device.#:     <computed>
      get_password_data:            "false"
      instance_state:               <computed>
      instance_type:                "t2.micro"
      ipv6_address_count:           <computed>
      ipv6_addresses.#:             <computed>
      key_name:                     <computed>
      network_interface.#:          <computed>
      network_interface_id:         <computed>
      password_data:                <computed>
      placement_group:              <computed>
      primary_network_interface_id: <computed>
      private_dns:                  <computed>
      private_ip:                   <computed>
      public_dns:                   <computed>
      public_ip:                    <computed>
      root_block_device.#:          <computed>
      security_groups.#:            <computed>
      source_dest_check:            "true"
      subnet_id:                    <computed>
      tenancy:                      <computed>
      volume_tags.%:                <computed>
      vpc_security_group_ids.#:     <computed>


Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.ibm-example: Creating...
  ami:                          "" => "ami-58d7e821"
  associate_public_ip_address:  "" => "<computed>"
  availability_zone:            "" => "<computed>"
  ebs_block_device.#:           "" => "<computed>"
  ephemeral_block_device.#:     "" => "<computed>"
  get_password_data:            "" => "false"
  instance_state:               "" => "<computed>"
  instance_type:                "" => "t2.micro"
  ipv6_address_count:           "" => "<computed>"
  ipv6_addresses.#:             "" => "<computed>"
  key_name:                     "" => "<computed>"
  network_interface.#:          "" => "<computed>"
  network_interface_id:         "" => "<computed>"
  password_data:                "" => "<computed>"
  placement_group:              "" => "<computed>"
  primary_network_interface_id: "" => "<computed>"
  private_dns:                  "" => "<computed>"
  private_ip:                   "" => "<computed>"
  public_dns:                   "" => "<computed>"
  public_ip:                    "" => "<computed>"
  root_block_device.#:          "" => "<computed>"
  security_groups.#:            "" => "<computed>"
  source_dest_check:            "" => "true"
  subnet_id:                    "" => "<computed>"
  tenancy:                      "" => "<computed>"
  volume_tags.%:                "" => "<computed>"
  vpc_security_group_ids.#:     "" => "<computed>"
aws_instance.ibm-example: Still creating... (10s elapsed)
aws_instance.ibm-example: Still creating... (20s elapsed)
aws_instance.ibm-example: Creation complete after 23s (ID: i-0a1d1c022a065acd6)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

You can check on your AWS Console that something is there!
<br> Now, let's edit the file and add a name to the instance. Then, do another `plan`.

```
→ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_instance.ibm-example: Refreshing state... (ID: i-0a1d1c022a065acd6)

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  ~ aws_instance.ibm-example
      tags.%:    "0" => "1"
      tags.Name: "" => "ibm-terraform-example"


Plan: 0 to add, 1 to change, 0 to destroy.
```

Cool, huh! Terrafor cache is refreshed and it is aware of all resources... he knows that your EC2 instance already exists and shows you a `diff` of what is deployed and what you have on your `tf` file.

```
→ terraform apply
```
And check the tag now on your AWS Console.

Now imagine this is on a source control system like git!
You can now commit your modifications, push and share configuration information as a developer now... not bad, huh?

```
git add main.tf
git commit -m "Basic webserver with tag"
git push
```

There you go... just a quick tast of something simple with terraform. You can deploy thousands of resources, create lots of things and keep your infrastructure version controlled.

Another advice I give is to take a look at [Cloud Custodian](https://github.com/capitalone/cloud-custodian)! I am sure you will be amazed of how much compliance and security checks you can make it automatically...

Now, let's move on to what you came here to see - Ansible!