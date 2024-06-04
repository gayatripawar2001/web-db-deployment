

# resource "aws_subnet" "public_subnet" {
#   vpc_id                  = "${aws_vpc.private-vpc.id}"
#   count                   = "${length(var.public_subnets_cidr)}"
#   cidr_block              = "${element(var.public_subnets_cidr,   count.index)}"
#   availability_zone       = "${element(var.availability_zones,   count.index)}"
#   map_public_ip_on_launch = true
#   tags = {
#     Name        = "${var.environment}-${element(var.availability_zones, count.index)}-      public-subnet"
#     Environment = "${var.environment}"
#   }
# }

# resource "aws_subnet" "private_subnet" {
#   vpc_id                  = "${aws_vpc.private-vpc.id}"
#   count                   = "${length(var.private_subnets_cidr)}"
#   cidr_block              = "${element(var.private_subnets_cidr, count.index)}"
#   availability_zone       = "${element(var.availability_zones,   count.index)}"
#   map_public_ip_on_launch = false
#   tags = {
#     Name        = "${var.environment}-${element(var.availability_zones, count.index)}-private-subnet"
#     Environment = "${var.environment}"
#   }
# }


resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.private-vpc.id
  cidr_block              = var.public_subnets_cidr
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.environment}-public-subnet"
    Environment = var.environment
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.private-vpc.id
  cidr_block              = var.private_subnets_cidr
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = false
  tags = {
    Name        = "${var.environment}-private-subnet"
    Environment = var.environment
  }
}