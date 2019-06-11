resource "aws_default_subnet" "AWSSubnet" {
  availability_zone = "${var.AWSRegion}a"

  tags = {
    Name = "${var.CustomerName} - ${var.RoleName} Subnet"
  }

  provider = "aws.SubAccount"
}
