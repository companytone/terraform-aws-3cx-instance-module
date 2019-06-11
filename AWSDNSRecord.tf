resource "aws_route53_record" "AWSDNSRecord" {
  zone_id  = "${var.AWSDNSZoneID}"
  name     = "${lower(var.CustomerSubdomain)}.${var.VendorDomainName}"
  type     = "A"
  ttl      = "300"
  records  = ["${aws_eip.AWSEIP.public_ip}"]
  provider = "aws.MainAccount"
}
