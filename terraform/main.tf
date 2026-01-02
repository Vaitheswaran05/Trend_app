resource "aws_vpc" "trend_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "trend-vpc"
  }
}

resource "aws_subnet" "trend_subnet" {
  vpc_id            = aws_vpc.trend_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "trend-subnet"
  }
}

resource "aws_internet_gateway" "trend_igw" {
  vpc_id = aws_vpc.trend_vpc.id
}

resource "aws_route_table" "trend_rt" {
  vpc_id = aws_vpc.trend_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.trend_igw.id
  }
}

resource "aws_route_table_association" "trend_rta" {
  subnet_id      = aws_subnet.trend_subnet.id
  route_table_id = aws_route_table.trend_rt.id
}

resource "aws_security_group" "jenkins_sg" {
  vpc_id = aws_vpc.trend_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_ec2" {
  ami           = "ami-03f4878755434977f"
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.trend_subnet.id
  security_groups = [aws_security_group.jenkins_sg.id]

  tags = {
    Name = "Jenkins-Server"
  }
}