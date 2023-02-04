##################################################################################
# NETWORKING
##################################################################################
# NETWORKING #
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  cidr           = var.vpc_cidr_block
  azs            = slice(data.aws_availability_zones.available.names, 0, (var.vpc_subnet_count))
  public_subnets = [for subnet in range(var.vpc_subnet_count) : cidrsubnet(var.vpc_cidr_block, 8, subnet)]

  enable_nat_gateway      = false
  enable_vpn_gateway      = false
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = local.common_tags
}

