#!/bin/bash

function package {
	echo "vagrant halt..."
	vagrant halt &&
	echo "remove existing package.box..." &&
	rm -f package.box &&
	echo "vagrant package..." &&
	vagrant package
}

function bundle {
	echo "unpacking 'package.box' file to 'unpacked' folder..." &&
	mkdir -p unpacked &&
	tar -xf package.box -C unpacked/ &&
	echo "bundle ovf & vmdk into tar.gz..." &&
	tar -czf base-vm.tar.gz -C unpacked box.ovf box-disk001.vmdk &&
	echo "removing 'unpacked' folder" &&
	rm -rf unpacked
}

function printhelp {
	echo "Usage:
-h, --help					Print this help
-s, --from-scratch			Build from scratch: destroy existing VM, create and provision
-b, --bundle				Bundle an existing package.box file to an tar.gz containing .ovf and .vmdk files
"
}

if [[ $1 == '-h' || $1 == '--help' ]]; then
	printhelp
elif [[ $1 == '-s' || $1 == '--from-scratch' ]]; then
	echo "Build from scratch..."
	echo "Destroy existing VM..."
	vagrant destroy -f &&
	echo "Update base box..." &&
	vagrant box update &&
	echo "Vagrant up..." &&
	vagrant up &&
	echo "packaging..." &&
	package
elif [[ $1 == '-b' || $1 == '--bundle' ]]; then
	echo "Bundle existing package.box..."
	if [[ -f package.box ]]; then
		bundle
	else
		echo "File not found: package.box"
		exit -1
	fi
elif [[ $1 == '' ]]; then
	echo "packaging..."
	package
else
	printhelp
	exit -1
fi
