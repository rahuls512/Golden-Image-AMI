# Define the Web Server
resource "aws_instance" "web" {
  ami           = data.aws_ami.this.id # refer from the data_source.tf for use golden image
  instance_type = var.instance_types
  key_name      = var.key_name
  subnet_id     = element([for each_subnet in aws_subnet.public_subnet : each_subnet.id], 0)

  tags = {
    Name = local.web_server
  }
  vpc_security_group_ids = [aws_security_group.web.id]
}