output "instances" {
  value = aws_instance.scott_ec2[*].id
}