output "vpc_id" {
  value = aws_vpc.scott_vpc.id
}

output "subnets_ids" {
  value = aws_subnet.scott_subnets[*].id
}