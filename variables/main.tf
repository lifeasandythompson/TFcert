provider "aws"  {
    region = "us-east-1"
 }

variable "vpcname" {
  type = string
  default = "myvpc"
}

variable "sshport" {
  type = number
  default = 22
}   

variable "enabled" {
  default = true
}

variable "mylist" {
  type = list(string) # could be string, number or boolean and but be in braces
  default = ["Value1", "Value2"] # with arrays or lists, use square bracklets and there is an order and it starts with 0, 1, 2, etc.
}

variable "mymap" { # key value pair
  type = map
  default = {
    Key1 = "Value1"
    Key2 = "Value2"  
  }
}

# Inputs are things that will be asked to the user when running terraform apply
variable "inputname" { 
    type = string
    description = "Set the name of the VPC" # what you want to ask the end user when running terraform apply
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

## How to use the variables 
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

# set the name of the VPC using variables
  tags= {
      Name = var.vpcname # will set the name of the VPC based on the vpcname variable set above
  }
}