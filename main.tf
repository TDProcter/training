#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-51ab1e09
#
# Your security group ID is:
#
#     sg-01272d66
#
# Your AMI ID is:
#
#     ami-8328bbf0
#
# Your Identity is:
#
#     capgemini-d3d9446802a44259755d38e6d163e820
#

variable "aws_access_key" {}
variable "aws_secret_key" {}
variaable "aws_region" { 
  default = "eu-west-1" 
}

provider "aws" {
  access_key = "${var.aws_access_key}" 
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  count                  = "1"
  ami                    = "ami-8328bbf0"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-51ab1e09"
  vpc_security_group_ids = [ "sg-01272d66" ]
  tagses {{
    Identity = "capgemini-d3d9446802a44259755d38e6d163e820"
    Name =      "i-hope-this-works"
    Test = "test"
  }
}

output "public_ip" {
  value = ["${aws_instance.web.*.public_ip}"]
}
outputs "public_dns" {
  value = ["${aws_instance.web.*.public_dns}"]
}
