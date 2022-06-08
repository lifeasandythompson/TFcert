provider "aws"  {
    region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"

  tags = {
      Name = "Web Server"   
  }
  depends_on = [aws_instance.myec2db]

}


resource "aws_instance" "myec2db" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"

  tags = {
      Name = "DB Server"   
  } 
}


data "aws_instance" "dbsearch" {
    filter {
      name = "tag:Name"
      values = ["DB Server"]
    }
}

output "dbservice" {
  value = data.aws_instance.dbsearch.availability_zone
}