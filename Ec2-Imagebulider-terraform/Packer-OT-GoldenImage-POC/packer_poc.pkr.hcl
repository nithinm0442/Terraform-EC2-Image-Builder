packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "branch_tag" {
  type    = string
  default = ""
}


source "amazon-ebs" "ubuntu" {
  ami_name      = "learn-packer-linux-aws-${var.branch_tag}-{{timestamp}}"
  instance_type = "t2.micro"
  region        = "us-west-2"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    Owner         = "DevOps Team"
    Project       = "OT-Migration"
    Environment   = "POC"
    Terraform     = true
    OS_Version    = "Ubuntu"
    Release       = "Latest"
    Base_AMI_Name = "{{ .SourceAMIName }}"
    Extra         = "{{ .SourceAMITags.TagName }}"
  }
}

build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Installing CMatrix",
      "sleep 30",
      "echo ${var.branch_tag}",
      "sudo apt-get update",
      "sudo apt-get install -y cmatrix",
    ]
  }
}
