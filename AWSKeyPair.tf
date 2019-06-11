module "ssh_key_pair" {
  source                = "git::https://github.com/cloudposse/terraform-aws-key-pair.git?ref=master"
  namespace             = "${var.SSHKeyNamespace}"
  stage                 = "${var.SSHKeyStage}"
  name                  = "${var.CustomerSubdomain}"
  ssh_public_key_path   = "${var.SSHKeyFolder}"
  generate_ssh_key      = "true"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
  chmod_command         = "chmod 600 %v"

  providers = {
    aws = "aws.SubAccount"
  }
}
