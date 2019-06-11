resource "aws_default_vpc" "AWSVPC" {
  tags = {
    Name = "Default VPC"
  }

  provider = "aws.SubAccount"
}
