

resource "random_string" "hash_master" {
  length = 6
  count = 1
  upper = false
  special = false
}


resource "hcloud_server" "master" {
  count = 1
  name = "tf-master-${random_string.hash_master.*.result[count.index]}"
  location = "nbg1"
  image = "ubuntu-18.04"
  server_type = "cx11"
  labels =  {
      ansible_inventory_groups = "all.master.etcd"
  }
}


resource "random_string" "worker" {
  length = 6
  count = 2
  upper = false
  special = false
}


# Create a new server running debian
resource "hcloud_server" "worker" {
  count = 2
  name = "tf-worker-${random_string.worker.*.result[count.index]}"
  location = "nbg1"
  image = "ubuntu-18.04"
  server_type = "cx11"
  labels =  {
      ansible_inventory_groups = "all.worker"
  }
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

