ping:
	ansible all -i inventory.ini -u vagrant --private-key=~/.vagrant.d/insecure_private_key -m ping