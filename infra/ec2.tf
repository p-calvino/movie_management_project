resource "aws_instance" "my_public_server" {
  ami                    = data.aws_ami.aws_basic_linux.id
  instance_type          = var.ec2_type
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.my_public_app_sg.id]
  key_name               = var.my_keypair

  tags = {
      Name = "public_server"
  }
}