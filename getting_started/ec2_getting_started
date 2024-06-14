provider "aws" {
  region = "us-east-2"
}


variable "server_port" {
  description = "value of the server port"
  default     = 8080
}


resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
}


resource "aws_security_group_rule" "example" {
  type              = "ingress"
  from_port         = var.server_port
  to_port           = var.server_port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.instance.id
}


resource "aws_instance" "terraform_example" {
  ami                    = "ami-09040d770ffe2224f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data                   = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF
  user_data_replace_on_change = true

  tags = {
    Name = "terraform-example"
  }
}


output "public_ip" {
  value       = aws_instance.terraform_example.public_ip
  description = "value of the public ip address of the instance"
}
