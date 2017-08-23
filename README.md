vagrant box: jojoob/base
========================

This is a Vagrant VirtualBox virtual machine definition to create a vagrant box.

## What's in there
The Vagrantfile takes a ubuntu box and does the following things:

* raises the memory to 2048 MB
* runs a provisioner
	* set the locale to "en_US.UTF-8"
	* set the timezone to "Europe/Berlin"
	* apt-get update and apt-get upgrade

## Create the box from the Vagrantfile
1. `vagrant up` creates the vm with the definitons from the Vagrant file and runs the provisioner
2. `vagrant package` will package the vm into a vagrant box

## Automate build
The build.sh script can be used to automate the box creation process.
Just do `./build.sh -s` to destroy an potential existing vm instance, vagrant up and vagrant package.

## Install the box
To use the box you have to edit the box/box.json file and adjust the url to match the absolute path of the package.box file on your system.
After that you can add the box via `vagrant box add /path/to/box/box.json`.
