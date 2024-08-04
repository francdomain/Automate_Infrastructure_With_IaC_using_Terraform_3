region = "us-east-1"

name = "fnc"

vpc_cidr = "172.16.0.0/16"

enable_dns_support = true

enable_dns_hostnames = true

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

tags = {
  Environment     = "production"
  Owner-Email     = "francis4fnc@gmail.com"
  Managed-By      = "terraform"
  Billing-Account = "1234567890"
}

# environment = "production"

ami = "ami-0b0af3577fe5e3532"

keypair = "my-ec2-key"

# Ensure to change this to your acccount number
account_no = "123456789"

master-username = "francis"

master-password = "devopspbl"

security_groups_detail = {
  name = {
    ext-alb    = "ext-alb-sg",
    bastion    = "bastion_sg",
    nginx      = "nginx-sg",
    int-alb    = "int-alb-sg",
    webservers = "webserver-sg",
    datalayer  = "datalayer-sg"
  }
  description = {
    ext-alb    = "Allow TLS inbound traffic",
    bastion    = "Allow incoming SSH connections.",
    nginx      = "Allow HTTPS inbound traffic from ex-ALB and SSH traffic from bastion",
    int-alb    = "Allow TLS inbound traffic from nginx reverse proxy server",
    webservers = "Allow TLS inbound traffic from int-ALB and SSH traffic from bastion",
    datalayer  = "Allow mysql inbound traffic from webservers and nfs from webservers and nginx",
  }
}
