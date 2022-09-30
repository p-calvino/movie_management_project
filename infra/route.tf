resource "aws_route_table" "tf_route_public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-igw.id
  }
}
resource "aws_route_table" "tf_route_private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tf_gateway.id
  }
}

resource "aws_route_table_association" "tf_pub_routeassoc_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.tf_route_public.id
}

resource "aws_route_table_association" "tf_pub_routeassoc_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.tf_route_public.id
}

resource "aws_route_table_association" "tf_pub_routeassoc_3" {
  subnet_id      = aws_subnet.public_3.id
  route_table_id = aws_route_table.tf_route_public.id
}

resource "aws_route_table_association" "tf_pri_routeassoc_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.tf_route_private.id
}

resource "aws_route_table_association" "tf_pri_routeassoc_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.tf_route_private.id
}

resource "aws_route_table_association" "tf_pri_routeassoc_3" {
  subnet_id      = aws_subnet.private_3.id
  route_table_id = aws_route_table.tf_route_private.id
}

