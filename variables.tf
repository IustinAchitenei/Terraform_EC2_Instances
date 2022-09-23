# aws region

variable "AWS_REGION"{
  default = "eu-west-3"
}

# ami from http://cloud-images.ubuntu.com/locator/ec2

variable "AMI"{
  
  default = "ami-052f10f1c45aa2155"
  
}


# ec2_user

variable "EC2_USER"{
  default = "ec2-user"
}

variable "instance_type" {
  default = "t3.micro"
}



