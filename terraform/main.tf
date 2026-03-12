provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "devops_server" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install docker.io -y
              sudo docker run -d -p 80:5000 danishfikri/random-devops-test
              EOF

  tags = {
    Name = "devops-project-server"
  }
}