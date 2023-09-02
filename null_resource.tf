# Define the Null Resource provision for web server
resource "null_resource" "provisioner" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    always_run = timestamp()
  }
  depends_on = [aws_instance.web]

  #Connecting through a web server with SSH
  connection {
    host        = aws_instance.web.public_ip
    type        = "ssh"
    user        = "ec2-user"
    private_key = var.awskey01
  }

  #Provisioner-file to Automate the file by using the file path for webserver
  provisioner "file" {
    content     = var.awskey01
    destination = "/home/ec2-user/awskey01"
    on_failure  = continue

  }

  #Provisioner-file to Automate the keypair change modification by using the inline rule for webserver
  provisioner "remote-exec" {
    inline = [
      "chmod 400 /home/ec2-user/awskey01"
    ]
  }
}