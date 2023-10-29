output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "target_group" {
  value = aws_lb_target_group.target_group.arn
}

output "alb_arn" {
  value = aws_lb.alb.arn
}
