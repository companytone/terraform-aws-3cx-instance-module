resource "aws_instance" "AWSInstance" {
  ami                    = "${var.AMIID}"
  instance_type          = "${var.AWSInstanceType}"
  subnet_id              = "${aws_default_subnet.AWSSubnet.id}"
  key_name               = "${module.ssh_key_pair.key_name}"
  vpc_security_group_ids = ["${aws_security_group.AWSSecurityGroup.id}"]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "20"
    delete_on_termination = "true"
  }

  # provisioner "local-exec" {
  #   command = "sudo apt-get update && sudo apt-get -y upgrade && sudo wget -O- http://downloads-global.3cx.com/downloads/3cxpbx/public.key | sudo apt-key add - && sudo echo \"deb http://downloads-global.3cx.com/downloads/debian stretch main\" | sudo tee /etc/apt/sources.list.d/3cxpbx.list && sudo apt-get update && sudo apt-get install -y net-tools 3cxpbx"
  # }

  tags {
    Name = "${var.CustomerName} - ${var.RoleName} Instance"
  }
  provider = "aws.SubAccount"
}
