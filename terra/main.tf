

resource "aws_instance" "my_vm" {
  ami           = "ami-053b0d53c279acc90" //Ubuntu AMI
  instance_type = "t2.micro"
  user_data     = file("gui/init.sh")
  tags = {
    Name = "My E3333",
  }
}

resource "aws_security_group" "my_vm" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_iam_user_policy" "test_policy" {
 name = "name"
 user = "terra-user"

 policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [{
   "Effect": "Allow",
   "Action": [
   "ec2:DescribeInstances"
   ],
   "Resource": "*"
 }]
}
 EOF
}
