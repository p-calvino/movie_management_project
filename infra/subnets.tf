resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-1"
  }
  }

  resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "eu-central-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-2"
  }
}


resource "aws_subnet" "public_3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.3.0/24"
  availability_zone = "eu-central-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-3"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.11.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "Private-Subnet-1"
  }
  }

  resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.12.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "Private-Subnet-2"
  }
}


resource "aws_subnet" "private_3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.13.0/24"
  availability_zone = "eu-central-1c"

  tags = {
    Name = "Private-Subnet-3"
  }
}