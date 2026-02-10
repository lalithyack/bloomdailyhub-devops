provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "bloomdailyhub" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y docker.io
              systemctl start docker
              EOF

  tags = {
    Name = "BloomDailyHub-EC2"
  }
}
