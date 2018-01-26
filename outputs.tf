output "arn" {
  description = "The ARN of the certificate"
  value       = "${aws_iam_server_certificate.certificate.arn}"
}

output "name" {
  description = "The name of the certificate"
  value       = "${aws_iam_server_certificate.certificate.name}"
}

output "id" {
  description = "The ID of the certificate"
  value       = "${aws_iam_server_certificate.certificate.id}"
}
