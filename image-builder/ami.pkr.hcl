source "amazon-ebs" "this" {
  assume_role {
    role_arn     = "arn:aws:iam::640111764884:role/stsassume-role"
    session_name = "packer-session"

  }
  region        = var.region
  source_ami    = data.amazon-ami.this.id
  instance_type = var.instance_type
  ssh_username  = var.ssh_user_name
  ami_name      = local.image_name
}

build {
  sources = [
    "source.amazon-ebs.this"
  ]

  # Install and configure the web server on the EC2 instance
  provisioner "shell" {
  inline = [
    "sudo yum update -y",                            
    "sudo yum install httpd -y",                   
    "sudo systemctl enable httpd",                 
    "sudo systemctl start httpd",                 
    "sudo yum install unzip -y",                   
    "sudo yum install wget -y",
    "sudo wget -P /tmp html https://github.com/rahuls512/installation_scripts/blob/main/html%20files.zip", 
    "sudo unzip -d /var/www/html/ /tmp/html%20files.zip",  
    "sudo chown -R apache:apache /var/www/html/",    
    "sudo systemctl restart httpd"                  
  ]
 }
}