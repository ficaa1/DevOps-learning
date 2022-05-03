# Hashicorp Configuration Language (HCL)

Blocks with key/value pairs

Multi Line Strings : preceded by <<EOF and ends with EOF

## Data types
### Maps
``` 
variable "amis" {
    type = map
    default = {
        "us-east-1": "ami-32180421805"
        "us-west-1": "ami-djafja3515"
    }
}
```

### Providers
A provider is required for TF to interact, you should use terraform init before trying to plan
```
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "-> 3.55.0"
        }
    }
}

provider "aws" {
    profile = "default"
    region = "us-west-1"
}
```
### Resources
```
resource "<type>" "<name>" {
    cidr_block  = "10.0.0.0/16"
    list = ["one","two","three"]
    block = {
        kurac = "palac"
    }
}
```

### Data Sources
```
data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name = "name"
        values = [...]
    }
}
```

## Variables
Stored in variables.tf. Default values can be entered in the file, if not, user is prompted to enter a value.

```
variables.tf

variable "instance_type" {}
variable "key_name" {}

main.tf

resource "aws_instance" "bastion" {
    instance_type = var.instance_type
    key_name = var.key_name
}
```

## Outputs
Used to explicitly return values assigned to resources configured within the corresponding main.tf file - once provisioned

```
outputs.tf

output "public_ip" {
    description = "public ip address"
    value = aws_instance.bastion.public_ip
}
```

## Functions
They exist :)