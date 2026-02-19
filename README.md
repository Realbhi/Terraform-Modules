
## Terraform Modules (Project Details)

### What are Terraform Modules?

A Terraform module is a reusable collection of Terraform configuration files (`.tf`) that are used to provision infrastructure.

Terraform modules help in:

* Reusing the same infrastructure code multiple times
* Avoiding duplicate resource blocks
* Creating multiple environments (dev, prod, stage) with the same base configuration
* Managing infrastructure in a structured and scalable way

In this project, the same infrastructure code is reused for multiple environments by using modules and passing different variable values.

---

## Infrastructure Provisioned Using Variables

Inside the `infra/` module folder, the following AWS resources are provisioned:

1. Key Pair
2. Default VPC + Security Group
3. EC2 Instances
4. S3 Bucket (configured similarly using variables)

Example EC2 configuration includes variables such as:

* `env` (environment name)
* `ami` (AMI ID for EC2)
* `count_of_instance` (number of instances to create)
* `instance_type` (instance type like t3.micro, t3.small)
* `instance_name` (used for naming and tagging resources)

The `env` variable is also used in resource names and tags to differentiate resources across environments.

Example conditional logic is used to control instance root volume size:

```hcl
volume_size = var.env == "Prod" ? 15 : 10
```

This allows different configurations depending on environment.

---

## Module-Based Environment Setup

The infrastructure in `infra/` is reused as a module and instantiated multiple times for different environments.

The `source = "./infra"` points Terraform to the module folder containing the reusable infrastructure code.

### Dev Environment Module

```hcl
module "dev-infra" {
  source            = "./infra"
  env               = "dev"
  ami               = "ami-019715e0d74f695be"
  count_of_instance = 1
  instance_type     = "t3.micro"
  instance_name     = "Dev-i-"
  instance_vol      = 10
}
```

### Prod Environment Module

```hcl
module "Prod-infra" {
  source            = "./infra"
  env               = "prod"
  ami               = "ami-019715e0d74f695be"
  count_of_instance = 2
  instance_type     = "t3.small"
  instance_name     = "Prod-i-"
  instance_vol      = 15
}
```

### Stage Environment Module

```hcl
module "Stage-infra" {
  source            = "./infra"
  env               = "stage"
  ami               = "ami-019715e0d74f695be"
  count_of_instance = 1
  instance_type     = "t3.micro"
  instance_name     = "Stage-i-"
  instance_vol      = 10
}
```

Each module call provisions a separate set of resources using the same Terraform code, but with different configuration values. This allows easy creation of multiple environments while keeping the infrastructure code reusable and maintainable.

