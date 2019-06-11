output "SSHCommand" {
  value = "ssh admin@${aws_route53_record.AWSDNSRecord.name} -i ${module.ssh_key_pair.private_key_filename}"
}

output "AWSSubAccountID" {
  value = "${aws_organizations_account.AWSSubaccount.id}"
}
