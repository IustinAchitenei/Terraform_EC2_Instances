# gateway

resource "aws_internet_gateway" "iustin-internet-gateway"{
	vpc_id = "${aws_vpc.iustin-vpc.id}"
	tags = {
		Name = "iustin-internet-gateway"
	}
}

#route table

resource "aws_route_table" "iustin-public-route-table"{
	vpc_id = "${aws_vpc.iustin-vpc.id}"
	route{
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.iustin-internet-gateway.id}"
	}
	tags = {
		Name = "iustin-public-route-table"
	}
}

#route table association

resource "aws_route_table_association" "iustin-crta-public-subnet-1"{
	subnet_id = "${aws_subnet.iustin-subnet-public-1.id}"
	route_table_id = "${aws_route_table.iustin-public-route-table.id}"
}

resource "aws_route_table_association" "iustin-crta-public-subnet-2"{
  subnet_id = "${aws_subnet.iustin-subnet-public-2.id}"
  route_table_id = "${aws_route_table.iustin-public-route-table.id}"
}

resource "aws_route_table_association" "iustin-crta-private-subnet-1"{
  subnet_id = "${aws_subnet.iustin-subnet-private-1.id}"
  route_table_id = "${aws_route_table.iustin-public-route-table.id}"
}

#public ip

data "http" "public-ip"{
  url = "http://ifconfig.me/ip"
}

output "public-ip"{
  value = data.http.public-ip.response_body
}

# security group public

resource "aws_security_group" "iustin-port-security"{
  vpc_id = "${aws_vpc.iustin-vpc.id}"

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${data.http.public-ip.response_body}/32","89.238.253.230/32","94.177.40.42/32"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "iustin-port-security"
  }
} 

# security group public

resource "aws_security_group" "iustin-port-security-private"{
  vpc_id = "${aws_vpc.iustin-vpc.id}"

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
    #conection only from the first public EC2 subnet
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "iustin-port-security-private"
  }
} 