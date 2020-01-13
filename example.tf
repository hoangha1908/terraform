provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  key_name = "hoangha2"
   connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras enable nginx1.12",
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
  }
}

resource "aws_key_pair" "example" {
  key_name = "hoangha2"
  public_key = file("~/.ssh/id_rsa.pub")
} 