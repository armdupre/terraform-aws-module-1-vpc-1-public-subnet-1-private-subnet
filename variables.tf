variable "FlowLogTrafficType" {
	default = "REJECT"
	type = string
}

variable "InboundIPv4CidrBlocks" {
	description = "List of IP Addresses /32 or IP CIDR ranges connecting inbound to App"
	type = list(string)
}

variable "PrivateSubnetCidrBlock" {
	default = "10.0.2.0/24"
	type = string
}

variable "PrivateSubnetAvailabilityZone" {
	default = "us-east-1a"
	type = string
}

variable "PublicSubnetAvailabilityZone" {
	default = "us-east-1a"
	type = string
}

variable "PublicSubnetCidrBlock" {
	default = "10.0.10.0/24"
	type = string
}

variable "Region" {
	default = "us-east-1"
	description = "Geographical location where resources can be hosted" 
	type = string
}

variable "Tag" {
	default = "aws"
	description = "App ID tag of application using the deployment"
	type = string
}

variable "UserEmailTag" {
	default = "terraform@example.com"
	description = "Email address tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	default = "terraform"
	description = "Login ID tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "UserProjectTag" {
	default = "example"
	description = "Project tag of user creating the deployment"
	type = string
}

variable "Version" {
	default = "5-0"
	description = "Versioning of the application using the deployment"
	type = string
}

variable "VpcCidrBlock" {
	default = "10.0.0.0/16"
	type = string
}

variable "VpcEnableDnsHostnames" {
	default = true
	type = bool
}

variable "VpcEnableDnsSupport" {
	default = true
	type = bool
}

variable "VpcInstanceTenancy" {
	default = "default"
	type = string
}