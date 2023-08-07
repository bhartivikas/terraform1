
provider "aws" {
  region = "ap-south-1"
}
resource "aws_key_pair" "tf-key-pair" {
  key_name   = "tf-key-pair"
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "tf-key-pair" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tf-key-pair.pem"
}


resource "aws_instance" "terraform_instance" {
  ami           = "ami-0ded8326293d3201b"
  instance_type = "t2.micro"
    key_name      = "tf-key-pair"
  


  tags = {
    Name = "terraform_instance"
  }
    connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("C:/project/terraform-jenkins/terraform project1/tf-key-pair.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'wait until SSH is ready'",
      "sudo yum upgrade -y",
      "sudo yum install docker -y",
      "sudo service docker start",
      "sudo service docker status"
    ]
  }





}
