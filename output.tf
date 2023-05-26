output "InternetGw" {
	value = aws_internet_gateway.InternetGw
}

output "PrivateSecurityGroup" {
	value = {
		"id" : aws_security_group.PrivateSecurityGroup.id
		"name" : aws_security_group.PrivateSecurityGroup.name
	}
}

output "PrivateSubnet" {
	value = {
		"availability_zone" : aws_subnet.PrivateSubnet.availability_zone
		"id" : aws_subnet.PrivateSubnet.id
		"name" : aws_subnet.PrivateSubnet.name
	}
}

output "PublicSecurityGroup" {
	value = {
		"id" : aws_security_group.PublicSecurityGroup.id
		"name" : aws_security_group.PublicSecurityGroup.name
	}
}

output "PublicSubnet" {
	value = {
		"availability_zone" : aws_subnet.PublicSubnet.availability_zone
		"id" : aws_subnet.PublicSubnet.id
		"name" : aws_subnet.PublicSubnet
	}
}

output "Vpc" {
	value = {
		"assign_generated_ipv6_cidr_block" : aws_vpc.Vpc.assign_generated_ipv6_cidr_block
		"cidr_block" : aws_vpc.Vpc.cidr_block
		"enable_dns_hostnames" : aws_vpc.Vpc.enable_dns_hostnames
		"enable_dns_support" : aws_vpc.Vpc.enable_dns_support
		"id" : aws_vpc.Vpc.id
		"instance_tenancy" : aws_vpc.Vpc.instance_tenancy
		"name" : aws.Vpc.name
		"tags" : aws_vpc.Vpc.tags
	}
}