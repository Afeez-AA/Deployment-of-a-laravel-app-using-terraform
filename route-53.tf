##################################################################################
# DATA
##################################################################################

resource "aws_route53_record" "site_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.record_name
  type    = "A"


  alias {
    name                   = aws_lb.nginx.dns_name
    zone_id                = aws_lb.nginx.zone_id
    evaluate_target_health = true
  }
}
