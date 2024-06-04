# resource "aws_instance" "example" {
#   ami           = "ami-12345678"  # Update with your desired AMI ID
#   instance_type = "t2.micro"       # Update with your desired instance type
#   subnet_id     = "subnet-12345678"  # Update with the subnet ID where you want to launch the instance
#   key_name      = "your_key_pair_name"  # Update with your key pair name
# }


resource "aws_instance" "bastion" {
  ami           = var.ami[var.region]
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]
  key_name = var.key_name
}

resource "aws_instance" "web" {
  ami                    = var.ami[var.region]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  key_name               = var.key_name
  tags = {
    Name        = "${var.environment}-web"
    Environment = var.environment
  }
}

resource "aws_instance" "db" {
  ami                    = var.ami[var.region]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.db-sg.id]
  key_name               = var.key_name
  tags = {
    Name        = "${var.environment}-db"
    Environment = var.environment
  }
}

