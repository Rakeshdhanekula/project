provider "aws" {
  region       = "eu-west-1"
  access_key   = "${var.AWS_ACCESS_KEY}"
  secret_key   = "${var.AWS_SECRET_KEY}"
}

data "aws_ami" "ubuntu" {
  most_recent  = true

  filter {
    name       = "name"
    values     = ["ubuntu/images/hvm-ssd/ubuntu-trusty-18.04-amd64-server-*"]
  }

  filter {
    name       = "virtualization-type"
    values     = ["hvm"]
  }

  owners       = ["099720109477"] # Canonical
}

resource "aws_key_pair" "david" {
  key_name     = "david"
  public_key   = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGeWOF+n3wRsQ2PAd7AxrAiWJQQmzqNf1cDxtihSqxxMKQa9WQ9p2LeUm39LG9H6dLMYfuVqVJfigpYThRIELw91Cah6sCjRBCH/7I8zzzescFoaPqpcLMAjIwreQr1zFgFHu7VeH/UxVmmLNjcKc68/GAg2OFsaP2XBQrxvceq6UQTNCG+9P8Bc5+9+dMD+DTnfZUQXQ0ESmM/mjYA5DsMILy40kRSB+5ZkJ1MoyWGIxZy4BAfdpAhb7TOjVRr+uhrrMRFjX54Yhmc+oZQ8T6YXR+GY6edV2L6xqilJtcKaYbUcCPOYRKlKKFTnNT4AgLID+Bx5yZ1prmKNR8wOLxH1lvW3GSrgZBKgdp5YkrgUCQbkoz6F+T6NVRsVZrmWcIobsO7u8hsgbOR1dtAtPXCSSjl3Q+plYT6uMCvIKpzkrL3kMOkAtglCqE4QDWJRCrC6nNR/SsQ5xAVUwRYaGZZNqY0ovey0yDHXoxv4RtV6cA2EKy+m0+R2Ulb3n6NySyMGB/TDpEv6OYrH7FM91PVz1hAE0fNFR4oIHm0pUP1OkJqfeuz81v/UwxC8VnXcF/cj3iKkoHDYUmp/R8ysnDn8EVBKxk+xAgTp60xGWQFvAsKTf8UplOIUA2YxAsS4QTjYN3n0MGjQX0wFpvfIuSSrXskjtfkHZVqW7rSIFmsw== gopalam.moram@AMAC02CC4XJMD6M"

}

resource "aws_instance" "vm" {
  ami          = "${data.aws_ami.ubuntu.id}"
  instance_type= "t2.micro"
  key_name     = "${aws_key_pair}"
  tags = {
    Name       = "myvm"
  }
}

