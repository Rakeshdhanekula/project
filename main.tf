# Credentials
provider "aws" {
  region     = "eu-west-1"
  access_key = "+++++++++++++++++++"
  secret_key = "+++++++++++++++++++++"
}

# Creating security group without inbound and outbound rules 

resource "aws_security_group" "sessionmanger_security_group" {
  name = "sessionmanager-group"
}

# Using ami Ubuntu 18.04 

resource "aws_instance" "hitman" {
  ami                  = "ami-089cc16f7f08c4457"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.hitman.name
  tags = {
    Name = "playground"
  }
}

