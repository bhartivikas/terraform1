
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "terraform_instance" {
  ami           = "ami-0ded8326293d3201b"
  instance_type = "t2.micro"
  


  tags = {
    Name = "terraform_instance"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"

  }

  provisioner "remote-exec" {
    inline = [
      "echo 'wait until SSH is ready'",

      "sudo yum upgrade -y",

      "sudo yum install docker -y"


    ]
  }



}
