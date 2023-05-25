locals {
	FlowLogTrafficType = "REJECT"
	InboundIPv4CidrBlock = var.InboundIPv4CidrBlock
	PrivateSubnetAvailabilityZone = var.PrivateSubnetAvailabilityZone
	PrivateSubnetCidrBlock = "10.0.2.0/24"
	ProjectTag = var.ProjectTag
	PublicSubnetAvailabilityZone = var.PublicSubnetAvailabilityZone
	PublicSubnetCidrBlock = "10.0.10.0/24"
	Region = var.Region
	RegionTag = upper(replace(local.Region, "-", "_"))
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	VpcCidrBlock = "10.0.0.0/16"
	VpcEnableDnsHostnames = true
	VpcEnableDnsSupport = true
	VpcInstanceTenancy = "default"
	uuid = substr(uuid(), 1, 6)
}