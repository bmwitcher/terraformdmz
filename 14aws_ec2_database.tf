resource "aws_instance" "tfsql" {
	ami           = "ami-02354e95b39ca8dec" #ami is region specific please check the region you will be working in
	instance_type = "t2.micro"
	key_name 	  = aws_key_pair.deployer.key_name #depends on file 13
	subnet_id 	  = aws_subnet.tfprivatesubnet.id #depends on file 4
	
	vpc_security_group_ids = [
		#depends on file 12
		aws_security_group.tfdbSG.id
	]
	
	tags = {
		Name = "MariaDB"
	}
	
	depends_on = [
		#depends on file 13
		aws_key_pair.deployer
	]
}