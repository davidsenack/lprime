provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-080e1f13689e07408"
  instance_type = "m5zn.2xlarge"
  vpc_security_group_ids = [aws_security_group.lprime_sg.id]
  key_name               = var.instance_key_name

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

output "ssh_command" {
  value = "ssh -i ${var.instance_key_name}.pem ec2-user@${aws_instance.example.public_ip}"
  description = "Command to SSH into the EC2 instance"
}
