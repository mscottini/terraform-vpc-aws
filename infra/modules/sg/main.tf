resource "aws_security_group" "scott_sg" {
  name        = "scott-sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "scott-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "scott_in_http" {
  security_group_id = aws_security_group.scott_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "scott_in_ssh" {
  security_group_id = aws_security_group.scott_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "scott_out" {
  security_group_id = aws_security_group.scott_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
