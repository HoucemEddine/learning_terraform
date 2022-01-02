resource "aws_vpc" "vpc-1" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"    
    
    tags = {
        Name = "vpc-1"
    }
}

resource "aws_subnet" "subnet-public-1" {
    vpc_id = "${aws_vpc.vpc-1.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "eu-west-3a"
    tags = {
        Name = "subnet-public-1"
    }
}
