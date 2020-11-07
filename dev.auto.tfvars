## Region
region   = "us-east-1"

## VPC
vpc_cidr = "10.0.0.0/16"

## Subnets
public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]
private_subnet_cidrs = [
  "10.0.3.0/24",
  "10.0.4.0/24"
]

## Security groups

# Public
public_sg_ingress = [
  {
    from_port   = 22  #SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 80  #http
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 443 #https
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

public_sg_egress = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  #all
    cidr_blocks = ["0.0.0.0/0"]
  }
]

# Private
private_sg_ingress = [
  {
    from_port = 22  #ssh
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      "10.0.1.0/24", # Pub Subnets
      "10.0.2.0/24"
    ]
  },
  {
    from_port = 80  #http
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [
      "10.0.1.0/24",
      "10.0.2.0/24",
      "10.0.3.0/24",  # Pvt Subnets
      "10.0.4.0/24"
    ]
  },
  {
    from_port = 443 #https
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = [
      "10.0.1.0/24",
      "10.0.2.0/24"
    ]
  }
]

private_sg_egress = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  #all
    cidr_blocks = ["0.0.0.0/0"]
  }
]