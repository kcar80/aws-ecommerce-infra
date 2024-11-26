# Security Group for EC2 Instance
resource "aws_security_group" "ec2_security_group" {
  name        = "ecommerce-ec2-sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EcommerceEC2SecurityGroup"
  }
}

# EC2 Instance
resource "aws_instance" "ecommerce_server" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.developer_key.key_name
  subnet_id     = aws_subnet.main_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]

  tags = {
    Name = "EcommerceServer"
  }
}

# SSH Key Pair
resource "aws_key_pair" "developer_key" {
  key_name   = "ecommerce-key"
  public_key = file("~/.ssh/ecommerce_key.pub")
}
