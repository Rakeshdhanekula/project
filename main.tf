variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

provider "aws" {
  region       = "eu-west-1"
  access_key   = "${var.AWS_ACCESS_KEY}"
  secret_key   = "${var.AWS_SECRET_KEY}"
}

resource "aws_key_pair" "david" {
  key_name     = "david"
  public_key   = "id_rsa.pub"
}

resource "aws_instance" "vm" {
  ami          = "ami-1967056a"
  instance_type= "t2.micro"
  key_name     = "${aws_key_pair.david.key_name}"
  tags = {
    Name       = "myvm"
  }
}

