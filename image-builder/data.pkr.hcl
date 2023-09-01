# Data source to fetch the latest Amazon Linux 2 AMI ID
data "amazon-ami" "this" {
  filters = {
    virtualization-type = "hvm"
    root-device-type    = "ebs"
    name                = "RHEL-9.2.0_HVM-*"
  }
  owners      = ["309956199498"]
  most_recent = true
  region      = var.region
}
