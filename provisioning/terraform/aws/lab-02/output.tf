output "output_public_dns" {
  value = "${aws_instance.default.*.public_dns}"
}