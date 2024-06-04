resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.private-vpc.id}"
  tags = {
    Name        = "${var.environment}-igw"
    Environment = "${var.environment}"
  }
}

