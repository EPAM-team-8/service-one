
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.service-one-zone.zone_id
  name    = "service1"
  type    = "A"

  alias {
    name                   = aws_lb.service-one-alb.dns_name
    zone_id                = aws_lb.service-one-alb.zone_id
    evaluate_target_health = false
  }
}
