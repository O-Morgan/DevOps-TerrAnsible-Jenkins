# aws availability zones are declared as data instead of resource https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones 
# you can use aws ec2 describe-availability-zones --region us-east-1 to get a list available within a region
data "aws_availability_zones" "available" {}

resource "aws_vpc" "mtc_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "mtc_vpc"
  }
}

resource "aws_internet_gateway" "mtc_IGW" {
  vpc_id = aws_vpc.mtc_vpc.id

  tags = {
    Name = "mtc_igw"
  }
}

# adding a public route table, followed by the route resource
resource "aws_route_table" "mtc_public_rt" {
  vpc_id = aws_vpc.mtc_vpc.id

  tags = {
    Name = "mtc-mtc-public-rt"

  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.mtc_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.mtc_IGW.id
}

resource "aws_default_route_table" "mtc_private_rt" {
  default_route_table_id = aws_vpc.mtc_vpc.default_route_table_id

  tags = {
    Name = "mtc-private-rt"
  }
}
