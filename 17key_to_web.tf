resource "null_resource" "key_update" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.tfkey.private_key_pem #depends on file 13
    host        = aws_instance.tfweb.public_ip #depends on file 15
  }

  provisioner "file" {
    source = "./Tfkey.pem"
    destination = "/Users/Bryant/Desktop/terraformdmz/Tfkey.pem" #local location
  }

  depends_on = [
    #depends on file 16
    null_resource.ip_update
  ]
}
