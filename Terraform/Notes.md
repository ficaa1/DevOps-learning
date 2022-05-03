# Terraform

## Intro
- IAC -> Version Control + Adressing environmental drift + resources sur demande
- Infrastructure codified into Terraform templates (.tf) -> déclaration de l'état desiré de l'infra
- Public Module Registry 
- Providers -> used to perform infra provisioning
- Terraform CLI -> **plan** and **apply** templates

## Root Module
- Directory on local fs containing Terraform code + config (.tf and .tfvars)
- Usually contains these 3 TF files:
  - main.tf
  - variables.tf
  - outputs.tf
  - terraform.tfstate & terraform.tfstate.backup

## Workspaces
- >terraform workspace
- Create Workspace for each separate environment e.g. dev,test,prod
- Isolate and manage multiple copies of TF state files

## main.tf
- Contains core Terraform code:
  - Resources
  - Provider
  - Data Sources
- Can be split up across multiple *.tf files

## variables.tf
- Variables referenced from within main.tf or other .tf files in the Root Module

```
variable "asg_desired" {
    type = number
    default = 2
}
```

## outputs.tf
- Used to explicitly export values at the end of a ``` terraform apply ``` execution

## Stateful
- Keeps track of all infra provisioned beyond day 0
- Manages infra configuration drift
- ``` terraform refresh ``` --> alert any changes
- Remote State --> Adapted to Teams to avoid merge conflicts
