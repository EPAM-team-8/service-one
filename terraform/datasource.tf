data "aws_subnet" "public_subnet" {
  vpc_id = data.aws_vpc.my-vpc.id
  filter {
    name   = "tag:Name"
    values = ["public"]
  }
}

data "aws_vpc" "my-vpc" {
  filter {
    name   = "tag:Name"
    values = ["my-vpc"]
  }
}

data "aws_route53_zone" "service-one-zone" {
  name = "epam.one."
}

/*data "aws_subnet_ids" "main-subnets" {
  vpc_id = data.aws_vpc.epam-vpc.id
  tags = {
    env = "test"
  }
}*/

data "aws_subnet" "private_subnet" {
  vpc_id = data.aws_vpc.my-vpc.id
  filter {
    name   = "tag:Name"
    values = ["private"]
  }
}

data "aws_security_group" "sg" {
  vpc_id = data.aws_vpc.my-vpc.id
  name   = "all"
}

output "vpc" {
  value = data.aws_vpc.my-vpc.id
}
output "subnet" {
  value = data.aws_subnet.public_subnet.id
}

output "sg" {
  value = data.aws_security_group.sg.id
}

data "aws_availability_zones" "available" {}