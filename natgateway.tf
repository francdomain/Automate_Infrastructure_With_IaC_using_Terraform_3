# Allocate Elastic IP
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = format("%s-EIP", var.name)
    },
  )

  depends_on = [
    aws_internet_gateway.igw
  ]
}

# Create Nat Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public.*.id, 0)

  tags = merge(
    var.tags,
    {
      Name = format("%s-Nat", var.name)
    },
  )

  depends_on = [
    aws_internet_gateway.igw
  ]
}
