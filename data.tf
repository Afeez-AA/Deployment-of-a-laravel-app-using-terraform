##################################################################################
# DATA
##################################################################################

data "aws_ssm_parameter" "ami" {
  name = "/aws/service/canonical/ubuntu/server/22.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}

# data "template_file" "hosts_inventory" {
#   template = <<EOF
# [webservers]
# ${join("\n", aws_instance.nginx.*.private_ip)}
# EOF
# }

# data "aws_security_group" "existing_security_group" {
#   name = "launch-wizard-1"
# }


