
# What We’ll Build in This Step:
# An EC2 instance (aws_instance)
# A security group (aws_security_group) that allows SSH (port 22) and maybe HTTP (port 80)
# An SSH key pair (if not already created

resource "aws_key_pair" "default" {
  key_name   = "terraform-key"
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  key_name               = aws_key_pair.default.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  associate_public_ip_address = true
  
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
            EOF

  tags = {
    Name = "Terraform-Web-Server"
  }
}
