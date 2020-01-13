provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"

   provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}





