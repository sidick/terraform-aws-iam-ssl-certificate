# terraform-aws-iam-ssl-certificate

AWS IAM SSL Certificate Terraform module
========================================

Terraform module which creates [AWS IAM Server Certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/ManagingServerCerts.html) on AWS.

These types of resources are supported:

* [AWS IAM Server Certificate](https://www.terraform.io/docs/providers/aws/r/iam_server_certificate.html)

Features
--------
This module allows the management of IAM SSL Server Certificates.

If there is a missing feature or a bug - [open an issue](https://github.com/sidick/terraform-aws-iam-ssl-certificate/issues/new).

Important
---------

There are some important notes about this resource type on the Terraform website, but for ease of access I've duplicated them here to make them harder to miss. Both of these are taken from <https://www.terraform.io/docs/providers/aws/r/iam_server_certificate.html>

* AWS performs behind-the-scenes modifications to some certificate files if they do not adhere to a specific format. These modifications will result in terraform forever believing that it needs to update the resources since the local and AWS file contents will not match after theses modifications occur. In order to prevent this from happening you must ensure that all your PEM-encoded files use UNIX line-breaks and that certificate_body contains only one certificate. All other certificates should go in certificate_chain. It is common for some Certificate Authorities to issue certificate files that have DOS line-breaks and that are actually multiple certificates concatenated together in order to form a full certificate chain.
* All arguments including the private key will be stored in the raw state as plain-text. [Read more about sensitive data in state](https://www.terraform.io/docs/state/sensitive-data.html).

Usage
-----

##### 1. SSL Certificate with no extra chain

```hcl
module "ssl_certificate" {
  source = "sidick/iam-ssl-certificate/aws"

  name_prefix      = "moduletest-"
  private_key      = "${file("ssl_cert_test.key")}"
  certificate_body = "${file("ssl_cert_test.crt")}"
}
```

##### 2. SSL Certificate with extra chain included

```hcl
module "ssl_certificate" {
  source = "sidick/iam-ssl-certificate/aws"

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
