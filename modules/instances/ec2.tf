resource "aws_instance" "ec2" {
  count = length(var.public_subnets) + length(var.private_subnets)
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "EC2 - ${count.index + 1}"
  }
}