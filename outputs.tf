##################################################################################
# OUTPUT
##################################################################################


output "aws_instance_public_dns" {
  value = aws_lb.nginx.dns_name
}
output "aws_instance_public_ip" {
  value = [for instance in aws_instance.nginx : instance.public_ip]
}

output "route53_sub_domain" {
  value = var.sub_domain_name
}

