# provider "name" {
# }
provider "aws" {
  region = "eu-west-2"
}

# resource "type" "name" {
# }
resource "aws_instance" "ibm-example" {
  #ami           = "ami-58d7e821"
  ami           = "ami-7c491f05"
  instance_type = "t2.micro"
  key_name      = "ibm-example"

  tags {
    Name = "ibm-terraform-example"
  }
}

resource "aws_instance" "ibm-example-2" {
  #ami           = "ami-58d7e821"
  ami           = "ami-7c491f05"
  instance_type = "t2.micro"
  key_name      = "ibm-example"

  tags {
    Name = "ibm-terraform-example-2"
  }
}
