resource "aws_security_group" "AWSSecurityGroup" {
  name        = "${var.CustomerName} - ${var.RoleName} Security Group"
  description = "Allow ${var.RoleName} specific ports"
  vpc_id      = "${aws_default_vpc.AWSVPC.id}"

  # For details, see https://www.3cx.com/docs/ports/

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH"
  }
  ingress {
    from_port   = 5000
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow 3CX Management Port"
  }
  ingress {
    from_port   = 5015
    to_port     = 5015
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow 3CX Setup port (HTTP)"
  }
  ingress {
    from_port   = 5060
    to_port     = 5060
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SIP protocol on TCP"
  }
  ingress {
    from_port   = 5060
    to_port     = 5060
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SIP protocol on UDP"
  }
  ingress {
    from_port   = 5061
    to_port     = 5061
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow secure SIP protocol on TCP"
  }
  ingress {
    from_port   = 5090
    to_port     = 5090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow 3CX Tunnel on TCP"
  }
  ingress {
    from_port   = 5090
    to_port     = 5090
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow 3CX Tunnel on UDP"
  }
  ingress {
    from_port   = 9000
    to_port     = 10999
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow 3CX Media Server (RTP)"
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Pinging (ICMP)"
  }
  ingress {
    from_port   = 500
    to_port     = 500
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow IPSec Port for strongSwan (IKE)"
  }
  ingress {
    from_port   = 4500
    to_port     = 4500
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow IPSec Port for strongSwan (IPSEC NAT-Traversal mode)"
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "50"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow IPSec Port for strongSwan (ESP)"
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "51"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow IPSec Port for strongSwan (AH)"
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Access to TCXProxy"
  }
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Access to Portainer Dashboard"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All Outgoing Traffic"
  }
  tags = {
    Name = "${var.CustomerName} - ${var.RoleName} Security Group"
  }
  provider = "aws.SubAccount"
}
