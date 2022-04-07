variable "resource_name" {
  type = string
}

resource "aws_iam_role" "ssm_agent_role" {
  name               = "${var.resource_name}-role"
  assume_role_policy = file("./iam/ssm-policy.json")
}

resource "aws_iam_instance_profile" "ssm_agent_role" {
  role = aws_iam_role.ssm_agent_role.name
}

resource "aws_iam_role_policy_attachment" "ssm_role_attached" {
  role       = aws_iam_role.ssm_agent_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

output "ssm_instance_profile_name" {
  value = aws_iam_instance_profile.ssm_agent_role.name
}
