resource "aws_eip" "AWSEIP" {
  instance = "${aws_instance.AWSInstance.id}"
  vpc      = true

  tags {
    Name = "${var.CustomerName} - ${var.RoleName} Elastic IP"
  }

  provider = "aws.SubAccount"
}
