module "xyz_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.5"
    #instance 1 information
  name = "xyz"
  instance_type               = "t3.micro"
  ami                         = var.ami_id
  key_name                    = var.key_name
  monitoring                  = false
  subnet_id                   = var.subnet_id1
  create_iam_instance_profile = true
  iam_role_name               = "xyz-role"
  iam_role_policies = {
    PowerUserAccess = "arn:aws:iam::aws:policy/PowerUserAccess"
  }
    #tags
  tags = merge(
    local.tags_all,
    {
      Machine_Name = "xyz"
    }
  )
    #instance 1 security group information
  security_group_name            = "xyz-sg"
  security_group_use_name_prefix = false
  security_group_ingress_rules = {
    rule1_inbound = {
      from_port = 22
      to_port   = 22
      protocol  = "ssh"
      cidr_ipv4 = "192.0.2.0/24"
    }
  }
  security_group_egress_rules = {
    rule1_outbound = {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      cidr_ipv4 = "0.0.0.0/0"
    }
  }
}

module "xyz_instance2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.5"
    #instance 2 information
  name = "xyz2"
  instance_type = "t3.micro"
  ami           = var.ami_id
  key_name      = var.key_name
  monitoring    = false
  subnet_id     = var.subnet_id2
  create_iam_instance_profile = true
  iam_role_name = "xyz-role2"
  iam_role_policies = {
    PowerUserAccess = "arn:aws:iam::aws:policy/PowerUserAccess"
  }
    #tags
  tags = merge(
    local.tags_all,
    {
      Machine_Name = "xyz2"
    }
  )
    #instance 2 security group information
  security_group_name            = "xyz-sg2"
  security_group_use_name_prefix = false
  security_group_ingress_rules = {
    rule1_inbound = {
      from_port = 22
      to_port   = 22
      protocol  = "ssh"
      cidr_ipv4 = "192.0.2.0/24"
    }
  }
  security_group_egress_rules = {
    rule1_outbound = {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      cidr_ipv4 = "0.0.0.0/0"
    }
  }
}