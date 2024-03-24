provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0a49b025fffbbdac6"
  instance_type = "m5zn.large"
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  root_block_device {
    volume_type = "gp2"
    volume_size = 40
  }

  tags = {
    Name = "lprimeInstance"
  }
}

resource "aws_security_group" "lprime_sg" {
  name        = "instance_sg"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_address]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


