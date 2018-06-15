# provider "name" {
# }
provider "aws" {
  region = "eu-west-1"
}

# resource "type" "name" {
# }
resource "aws_instance" "ibm-example" {
  ami           = "ami-58d7e821"
  instance_type = "t2.micro"

  tags {
    Name = "ibm-terraform-example"
  }
}
