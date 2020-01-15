resource "aws_instance" "example" {
  ami           = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  key_name = "hoangha2"
   connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("~/.ssh/hoangha2.ppk")
    host     = self.public_ip
  } 
}
output "ip" {
  value = aws_instance.example.public_ip
}