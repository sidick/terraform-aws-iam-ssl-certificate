resource "aws_iam_server_certificate" "certificate" {
  name_prefix       = "${var.name_prefix}"
  certificate_body  = "${var.certificate_body}"
  private_key       = "${var.private_key}"
  certificate_chain = "${var.certificate_chain}"

  lifecycle {
    create_before_destroy = true
  }
}
