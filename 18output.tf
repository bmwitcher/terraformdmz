

output "Web_public_ip" {
	value = aws_instance.tfweb.public_ip
}

output "MariaDB_private_ip" {
	value = aws_instance.tfsql.private_ip
}