provider "aws" {
region = "us-east-1"
access_key = "AKIAWLPFLO5CTE7KT7UR"
secret_key = "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"
}

resource "aws_instance" "one" {
ami = "ami-0715c1897453cabd1"
instance_type = "t2.medium"
  key_name              = "terraproject"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone     = "us-east-1a"
  user_data             = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my website created by terraform infrastructure by chandu server-1" > /var/www/html/index.html
EOF
tags = {
Name = "swiggy-01"
}
}

resource "aws_instance" "two" {
ami = "ami-0715c1897453cabd1"
instance_type = "t2.medium"
  key_name              = "terraproject"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone     = "us-east-1b"
  user_data             = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my website created by terraform infrastructure by chandu server-2" > /var/www/html/index.html 
EOF
tags = {
Name = "swiggy-02"
}
}

