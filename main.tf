# t3.public.1 

resource "aws_instance" "iustin-ec2-public-1"{
	ami = "${var.AMI}"
	instance_type = "${var.instance_type}"

	subnet_id = "${aws_subnet.iustin-subnet-public-1.id}"
	
	vpc_security_group_ids = ["${aws_security_group.iustin-port-security.id}"]

	key_name = "${aws_key_pair.iustin-paris-region-key-pair-2.id}"


	connection {
		user = "${var.EC2_USER}"
		host = self.public_ip
		private_key = file("${path.module}/iustin-paris-region-key-pair-2.pem")
	}
		tags = {
			Name = "iustin-ec2-public-1"
		}
}

# t3.public.2 

resource "aws_instance" "iustin-ec2-public-2"{
	ami = "${var.AMI}"
	instance_type = "${var.instance_type}"

	subnet_id = "${aws_subnet.iustin-subnet-public-2.id}"
	
	vpc_security_group_ids = ["${aws_security_group.iustin-port-security.id}"]
	key_name = "${aws_key_pair.iustin-paris-region-key-pair-2.id}"

	connection {
		user = "${var.EC2_USER}"
		host = self.public_ip
		private_key = file("${path.module}/iustin-paris-region-key-pair-2.pem")
	}
		tags = {
		Name = "iustin-ec2-public-2"
	}

}

# t3.public.2 

resource "aws_instance" "iustin-ec2-private-1"{
	ami = var.AMI
	instance_type = "${var.instance_type}"

	subnet_id = "${aws_subnet.iustin-subnet-private-1.id}"
	
	vpc_security_group_ids = ["${aws_security_group.iustin-port-security-private.id}"]

	key_name = "${aws_key_pair.iustin-paris-region-key-pair-2.id}"

	connection {
		user = "${var.EC2_USER}"
		host = self.public_ip
		private_key = file("${path.module}/iustin-paris-region-key-pair-2.pem")
	}
		tags = {
			Name = "iustin-ec2-private-1"
		}
}

#key pair with the ssh-keygen -f iustin-paris-region-key-pair-2

resource "aws_key_pair" "iustin-paris-region-key-pair-2"{
	key_name = "iustin-paris-region-key-pair-2"
	public_key = file("./iustin-paris-region-key-pair-2.pub")
}