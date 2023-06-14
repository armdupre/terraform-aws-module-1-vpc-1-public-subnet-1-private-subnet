output "InternetGw" {
	description = "Internet Gateway resource associated with the virtual private cloud"
	value = aws_internet_gateway.InternetGw
}

output "PrivateSecurityGroup" {
	description = "Security group resource associated with the private subnet"
	value = {
		"id" : aws_security_group.PrivateSecurityGroup.id
		"name" : aws_security_group.PrivateSecurityGroup.name
	}
}

output "PrivateSubnet" {
	description = "Subnet resource associated with the private subnet"
	value = {
		"availability_zone" : aws_subnet.PrivateSubnet.availability_zone
		"id" : aws_subnet.PrivateSubnet.id
	}
}

output "PublicSecurityGroup" {
	description = "Security group resource associated with the public subnet"
	value = {
		"id" : aws_security_group.PublicSecurityGroup.id
		"name" : aws_security_group.PublicSecurityGroup.name
	}
}

output "PublicSubnet" {
	description = "Subnet resource associated with the public subnet"
	value = {
		"availability_zone" : aws_subnet.PublicSubnet.availability_zone
		"id" : aws_subnet.PublicSubnet.id
	}
}

output "Vpc" {
	description = "Vpc resource associated with the virtual private cloud"
	value = {
		"assign_generated_ipv6_cidr_block" : aws_vpc.Vpc.assign_generated_ipv6_cidr_block
		"cidr_block" : aws_vpc.Vpc.cidr_block
		"enable_dns_hostnames" : aws_vpc.Vpc.enable_dns_hostnames
		"enable_dns_support" : aws_vpc.Vpc.enable_dns_support
		"id" : aws_vpc.Vpc.id
		"instance_tenancy" : aws_vpc.Vpc.instance_tenancy
		"tags" : aws_vpc.Vpc.tags
	}
}