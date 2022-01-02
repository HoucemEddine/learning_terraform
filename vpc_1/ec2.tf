resource "aws_instance" "web1" {
    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"
    # VPC
    subnet_id = "${aws_subnet.subnet-public-1.id}"
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    # the Public SSH key
    key_name = "${aws_key_pair.key-pair-1.id}"
    # nginx installation
    provisioner "file" {
        source = "initial.sh"
        destination = "/tmp/initial.sh"
    }
    provisioner "remote-exec" {
        inline = [
             "chmod +x /tmp/initial.sh",
             "sudo /tmp/initial.sh"
        ]
    }
    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
}
// Sends your public key to the instance
resource "aws_key_pair" "key-pair-1" {
    key_name = "key-pair-1"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
