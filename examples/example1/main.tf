provider "aws" {
  region = "eu-west-1"
}

module "ssl_certificate" {
  source = "../../"

  name_prefix      = "moduletest-"
  private_key      = "${file("ssl_cert_test.key")}"
  certificate_body = "${file("ssl_cert_test.crt")}"
}

output "arn" {
  description = "The ARN of the certificate"
  value       = "${module.ssl_certificate.arn}"
}

output "this_certificate_name" {
  description = "The name of the certificate"
  value       = "${module.ssl_certificate.name}"
}

output "this_certificate_id" {
  description = "The ID of the certificate"
  value       = "${module.ssl_certificate.id}"
}
