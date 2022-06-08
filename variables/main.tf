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

## How to use the variables 
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

# set the name of the VPC using lists
  tags = {
      Name = var.inputname # will set the name of the VPC based on the input variable defined above
  }
}

output "vpcid" {
  value = aws_vpc.myvpc.id # format is resourcegivenname.givenname.attribute
}