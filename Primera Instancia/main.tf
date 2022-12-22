provider "aws" {
    region = "eu-west-1"
}

data "aws_vpc" "default" {
    default = true
}

resource "aws_instance" "servidor" {
    ami = "ami-0fe0b2cf0e1f25c8a"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.sc-prueba.id]


    user_data = <<-EOF
        #!/bin/bash
        echo "Hola Terraformers!" > index.html
        nohup busybox httpd -f -p 80 &
        EOF

    tags = {
        Name = "servidor"
    }
}

resource "aws_security_group" "sc-prueba" {
    name = "sc-prueba"
    vpc_id = data.aws_vpc.default.id

    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        to_port = 80
        protocol = "TCP"

    }
}