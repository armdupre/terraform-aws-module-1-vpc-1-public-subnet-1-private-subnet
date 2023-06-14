resource "aws_iam_role" "VPCFlowLogAccessRole" {
	name = local.FlowLogAccessRoleName
	assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": "sts:AssumeRole",
			"Principal": {
				"Service": "vpc-flow-logs.amazonaws.com"
			},
			"Effect": "Allow"
		}
	]
}
EOF
	permissions_boundary = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
	path = "/"
}