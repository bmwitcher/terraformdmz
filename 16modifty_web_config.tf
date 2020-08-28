resource "null_resource" "ip_update" {
  //To connect to instance
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.tfkey.private_key_pem
    host        = aws_instance.tfwordpress.public_ip
  }


  depends_on = [
    #depends on file 15
    aws_instance.tfweb
  ]
}
