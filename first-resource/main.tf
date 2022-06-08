provider "aws"  {
    region = "us-east-1"
 }

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.inputname ["Key1"] # will set the name of the VPC based on the map and key value defined in the variable set above
  }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

variable "mytuple" { # the difference between a tuple and a list is that a tuple supports multiple data types
    type = tuple([string, number, string])
    default = ["cat", 1, "dog"]
}

variable "myobject" { # the difference between an object and a map is that an object can support multiple data types
    type = object({naame = string, port = list(number)})
    default = {
        name = "Andy"
        port = [22, 25, 80]
    }
}