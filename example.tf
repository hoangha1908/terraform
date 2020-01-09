provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c322300a1dd5dc79"
  instance_type = "t1.micro"
  key_name = "hoangha2"
}
resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}