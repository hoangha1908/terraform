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
      "sudo yum -y install httpd",
      "sudo systemctl start httpd"
    ]
  }
}