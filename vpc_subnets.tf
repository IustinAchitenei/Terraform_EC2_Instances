# vpc 

resource "aws_vpc" "iustin-vpc"{
	cidr_block = "10.0.0.0/16"
	enable_dns_support = "true"
	enable_dns_hostnames = "true"
# enable_classiclink = "false" 
	instance_tenancy = "default" 

	tags = {
		Name = "iustin-vpc"
	}
}

# public subnet 1

resource "aws_subnet" "iustin-subnet-public-1"{
	vpc_id = "${aws_vpc.iustin-vpc.id}"
	cidr_block = "10.0.1.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = "eu-west-3a"

	tags = {
		Name = "iustin-subnet-public-1"
	}
}

# public subnet 2

resource "aws_subnet" "iustin-subnet-public-2"{
	vpc_id = "${aws_vpc.iustin-vpc.id}"
	cidr_block = "10.0.2.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = "eu-west-3b"

	tags = {
		Name = "iustin-subnet-public-2"
	}
}

#  private subnet 1

resource "aws_subnet" "iustin-subnet-private-1"{
	vpc_id = "${aws_vpc.iustin-vpc.id}"
	cidr_block = "10.0.128.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = "eu-west-3a"

	tags = {
		Name = "iustin-subnet-private-1"
	}
}

#  private subnet 2

resource "aws_subnet" "iustin-subnet-private-2"{
	vpc_id = "${aws_vpc.iustin-vpc.id}"
	cidr_block = "10.0.129.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = "eu-west-3b"

	tags = {
		Name = "iustin-subnet-public-2"
	}
}


