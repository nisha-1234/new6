#Declaring AWS Provider and credentials
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAS7T2UNA2DZIOJBXL"
  secret_key = "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"
}
#######################################################
#Creating Webserver
resource "aws_instance" "webserver" {
 ami = "ami-08895422b5f3aa64a"
 instance_type = "t2.micro"
 key_name = var.keyname
 vpc_security_group_ids = [var.linux_security_group]
 subnet_id = var.publicsubnetid
 associate_public_ip_address = "true"
 
 tags = {
  Name = "Webserver"
 }
}
output "Webserver_IP" {
  value = aws_instance.webserver.public_ip
}
output "Webserver_instance_id" {
  value = aws_instance.webserver.id
}
#######################################################

