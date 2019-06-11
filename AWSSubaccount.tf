resource "aws_organizations_account" "AWSSubaccount" {
  name      = "${var.CustomerName}"
  email     = "customer-${lower(var.CustomerSubdomain)}@${var.VendorDomainName}"
  role_name = "companytone"
  provider  = "aws.MainAccount"
}
