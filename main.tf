resource "aws_vpc" "Vpc" {
	cidr_block = local.VpcCidrBlock
	instance_tenancy = local.VpcInstanceTenancy
	enable_dns_support = local.VpcEnableDnsSupport
	enable_dns_hostnames = local.VpcEnableDnsHostnames
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_VPC_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_subnet" "PublicSubnet" {
	availability_zone = local.PublicSubnetAvailabilityZone
	cidr_block = local.PublicSubnetCidrBlock
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_INPOST_PUBLIC_SUBNET_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_subnet" "PrivateSubnet" {
	availability_zone = local.PrivateSubnetAvailabilityZone
	cidr_block = local.PrivateSubnetCidrBlock
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_INPOST_PRIVATE_SUBNET_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_security_group" "PublicSecurityGroup" {
	name = "${local.UserLoginTag}_${local.ProjectTag}_PUBLIC_SECURITY_GROUP_${local.RegionTag}"
	description = "${local.UserLoginTag}_${local.ProjectTag}_PUBLIC_SECURITY_GROUP_${local.RegionTag}"
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_PUBLIC_SECURITY_GROUP_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_security_group_rule" "PublicIngress1" {
	type = "ingress"
	security_group_id = aws_security_group.PublicSecurityGroup.id
	protocol = "-1"
	from_port = 0
	to_port = 0
	source_security_group_id = aws_security_group.PublicSecurityGroup.id
}

resource "aws_security_group_rule" "PublicIngress443" {
	type = "ingress"
	security_group_id = aws_security_group.PublicSecurityGroup.id
	protocol = "tcp"
	from_port = 443
	to_port = 443
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "PublicEgress1" {
	type = "egress"
	security_group_id = aws_security_group.PublicSecurityGroup.id
	protocol = "-1"
	to_port = 0
	from_port = 0
	cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group" "PrivateSecurityGroup" {
	name = "${local.UserLoginTag}_${local.ProjectTag}_PRIVATE_SECURITY_GROUP_${local.RegionTag}"
	description = "${local.UserLoginTag}_${local.ProjectTag}_PRIVATE_SECURITY_GROUP_${local.RegionTag}"
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_PRIVATE_SECURITY_GROUP_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_security_group_rule" "PrivateIngress1" {
	type = "ingress"
	security_group_id = aws_security_group.PrivateSecurityGroup.id
	protocol = "-1"
	from_port = 0
	to_port = 0
	source_security_group_id = aws_security_group.PrivateSecurityGroup.id
}

resource "aws_security_group_rule" "PrivateEgress1" {
	type = "egress"
	security_group_id = aws_security_group.PrivateSecurityGroup.id
	protocol = "-1"
	to_port = 0
	from_port = 0
	cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_default_security_group" "DefaultEgress1" {
	vpc_id = aws_vpc.Vpc.id

	egress {
		protocol = -1
		self = true
		from_port = 0
		to_port = 0
	}
}

resource "aws_internet_gateway" "InternetGw" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_INTERNET_GW_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_route" "PublicRoute" {
	destination_cidr_block = "0.0.0.0/0"
	route_table_id = aws_route_table.PublicRouteTable.id
	gateway_id = aws_internet_gateway.InternetGw.id
	depends_on = [
		aws_internet_gateway.InternetGw
	]
}

resource "aws_route_table" "PublicRouteTable" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_PUBLIC_ROUTE_TABLE_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_route_table" "PrivateRouteTable" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_PRIVATE_ROUTE_TABLE_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_route_table_association" "PublicSubnetRouteTableAssociation" {
	route_table_id = aws_route_table.PublicRouteTable.id
	subnet_id = aws_subnet.PublicSubnet.id
}

resource "aws_route_table_association" "PrivateSubnetRouteTableAssociation" {
	route_table_id = aws_route_table.PrivateRouteTable.id
	subnet_id = aws_subnet.PrivateSubnet.id
}