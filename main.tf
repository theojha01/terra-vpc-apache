resource "aws_vpc" "lwterra" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_default_subnet" "subnetlw" {
  availability_zone = "us-east-1a"

  tags = {
    Name = "Subnet for North Virginia"
  }
}

resource "aws_security_group" "SecGroup" {
  name        = "TLS"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.lwterra.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc for ec2"
  }
}
