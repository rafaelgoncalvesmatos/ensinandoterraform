provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws_credentials"
  profile                 = "suporte"
}

resource "aws_instance" "default" {
  ami             = "ami-0378588b4ae11ec24"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.default.key_name}"
  security_groups = ["${aws_security_group.default.name}"]
}

resource "aws_key_pair" "default" {
  key_name   = "my-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "default" {
  name = "allow_ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "output_public_dns" {
  value = "${aws_instance.default.public_dns}"
}