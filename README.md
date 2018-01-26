# terraform-aws-iam-ssl-certificate

AWS IAM SSL Certificate Terraform module
========================================

Terraform module which creates [AWS IAM Server Certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/ManagingServerCerts.html) on AWS.

These types of resources are supported:

* [AWS IAM Server Certificate](https://www.terraform.io/docs/providers/aws/r/iam_server_certificate.html)

Features
--------
This module allows the management of IAM SSL Server Certificates

If there is a missing feature or a bug - [open an issue](https://github.com/sidick/terraform-aws-iam-ssl-certificate/issues/new).

Usage
-----

##### 1. SSL Certificate with no extra chain

```hcl
module "ssl_certificate" {
  source = "sidick/terraform-aws-iam-ssl-certificate/aws"

  name_prefix      = "moduletest-"
  private_key      = "${file("ssl_cert_test.key")}"
  certificate_body = "${file("ssl_cert_test.crt")}"
}
```

##### 2. SSL Certificate with extra chain included

```hcl
module "ssl_certificate" {
  source = "sidick/terraform-aws-iam-ssl-certificate/aws"

  name_prefix       = "moduletest-"
  private_key       = "${file("ssl_cert_test.key")}"
  certificate_body  = "${file("ssl_cert_test.crt")}"
  certificate_chain = "${file("ssl_cert_test_chain.crt")}"
}
```

Authors
-------

Module managed by [Simon Dick](https://github.com/sidick).

License
-------

BSD 3-Clause License. See LICENSE for full details.
