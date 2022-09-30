resource "aws_internet_gateway" "terraform-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-igw"
  }
}

resource "aws_eip" "tf_allocation_ip" {
  vpc      = true
}

resource "aws_nat_gateway" "tf_gateway" {

  allocation_id = aws_eip.tf_allocation_ip.id
  subnet_id     = aws_subnet.public_1.id
  connectivity_type = "public"

  tags = {
    Name = "Terraform-Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.terraform-igw]
}