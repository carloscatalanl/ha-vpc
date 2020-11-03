## Internet Gateway
resource "aws_internet_gateway" "gateway" {
  vpc_id = var.vpc_main_id
  tags = {
    Name = "Internet Gateway"
  }
}

## Route Table
resource "aws_route_table" "route_table_public" {
  vpc_id = var.vpc_main_id

  route {
    cidr_block = "0.0.0.0/0" # The target is the internet gateway
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "Public Subnet"
  }
}

## Route Table Association
resource "aws_route_table_association" "route_table_public_association" {
  count          = length(var.public_subnets)
  subnet_id      = element(var.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.route_table_public.id
  depends_on     = [aws_route_table.route_table_public]
}

## Elastic IP
resource "aws_eip" "nat" {
  count = length(var.public_subnets)
  vpc   = true
}