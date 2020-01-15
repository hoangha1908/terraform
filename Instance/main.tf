resource "aws_instance" "instance" {
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    associate_public_ip_address= "${var.publicip}"
    key_name= "${var.key}"
        tags = {
        Name = "${var.name}"
    }
}