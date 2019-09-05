provider "aws" {
  region    = "us-east-1"
  shared_credentials_file   = "~/.aws_credentials"
  profile = "suporte"
}

resource "aws_instance" "default" {
  ami = "ami-0378588b4ae11ec24"
  instance_type = "t2.micro"
}

