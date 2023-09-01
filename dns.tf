# Define the AWS Route 53 zone
resource "aws_route53_zone" "this" {
  name = "devopsautomation-with-rahulsharan.link"
}

# Define the A record for the EC2 instance (assuming public IP)
resource "aws_route53_record" "this" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "devopsautomation-with-rahulsharan.link"
  type    = "A"

  # Use the public IP address of the EC2 instance as the DNS target
  records = [aws_instance.web.public_ip]
  ttl     = 300 # Set the TTL (Time To Live) as needed
}
