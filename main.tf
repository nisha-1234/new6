#Declaring AWS Provider and credentials
provider "aws" {
  region     = "us-west-1"
  access_key = "AKIAS7T2UNA2DZIOJBXL"
  secret_key = "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"
}
#######################################################
#Creating Webserver
resource "aws_instance" "webserver" {
 ami = "ami-01a9db914db1193ec"
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
#Creating Application
resource "aws_instance" "application" {
 ami = "ami-05feb7439e86af1d9"
 instance_type = "t2.micro"
 key_name = var.keyname
 vpc_security_group_ids = [var.windows_security_group]
 subnet_id = var.privatesubnetid
 
 tags = {
  Name = "application"
 }
}
output "Application_IP" {
  value = aws_instance.application.public_ip
}
output "Application_instance_id" {
  value = aws_instance.application.id
}
#######################################################
#Creating db
resource "aws_instance" "db" {
 ami = "ami-0bac45e8972d2593e"
 instance_type = "t3.xlarge"
 key_name = var.keyname
 vpc_security_group_ids = [var.windows_security_group]
 subnet_id = var.privatesubnetid
 
 tags = {
  Name = "db"
 }
}
output "db_IP" {
  value = aws_instance.db
}
output "db_instance_id" {
  value = aws_instance.db.id
}
########################################################
