resource "aws_instance" "default" {
  ami             = "${var.ami_type}"
  instance_type   = "${var.instance_type}"
  key_name        = "${aws_key_pair.default.key_name}"
  security_groups = ["${aws_security_group.default.name}"]
}

resource "aws_key_pair" "default" {
  key_name   = "my-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}