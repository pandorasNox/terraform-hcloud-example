

# Create a new server running debian
resource "hcloud_server" "tf-exampel-node" {
  count = 1
  name = "tf-exampel-node-${count.index}"
  location = "nbg1"
  image = "ubuntu-18.04"
  server_type = "cx11"
  #   user_data = ""
#   ssh_keys = [
#     "${var.single_ssh_key_id}"
#   ]


#   connection {
#     type = "ssh"
#     user = "root"
#     private_key = "${file(var.pvt_key)}"
#     timeout = "2m"
#   }


#   provisionor "remote-exec" {
#     inline = [
#       "echo \"hello world\" > /terraform-was-here",
#       "echo \"foobar\""
#     ]
#   }
}

