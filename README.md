# Terraform_EC2_Instances

VPC with range 10.0.0.0/16

2 public subnets (10.0.1.0/24 and 10.0.2.0/24)

2 private subnets (10.0.128.0/24 and 10.0.129.0/24)

2 EC2 t3.micro instances, each connected to one of the public subnets

Accepted connection on: 

  - tcp/22 - only from own public IP
  
  - tcp/80 - any IP
  
1 EC2 t3.micro instance, connected to one of the prioate subnets

Accepted connections on:

  - tcp/22 - only from one of the public EC2 instances, in this case the first one
