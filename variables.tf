variable "name_prefix" {
  description = "Prefix of the Certificate name"
}

variable "path" {
  default     = "/"
  description = "The IAM path for the server certificate"
}

variable "private_key" {
  description = "The contents of the private key in PEM-encoded format"
}

variable "certificate_body" {
  description = "The contents of the public key certificate in PEM-encoded format"
}

variable "certificate_chain" {
  description = "The contents of the certificate chain. This is typically a concatenation of the PEM-encoded public key certificates of the chain"
  default     = ""
}
