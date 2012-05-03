vagrant-basebox
===============

This is a collection of scripts to create a minimal vagrant CentOS box.

There is some configuration for the CentoS release, VM name, memory and disk 
size in config/config.sh

The main script is bin/create-vm.sh, it will launch the other scripts to 
download the CentOS image, create a floppy kickstart image, dvd image wich uses
the floppy kickstart and use VirtualBox to create and launch the virtual 
machine. This will take a while.

Once this is finished you can launch the bin/create-vagrant-basebox.sh, this 
will do the final step of packaging the virtual machine into a vagrant box.

The script was just tested on:
- Fedora 16
- with sudo rights
- creating a CentOS 6.2 box
- on VirtualBox 4.1.12

The kickstart file config/ks.cfg makes assumptions on the CentOS release and 
VirtualBox version, as it installs the VirtualBoxAdditions and these have to 
match the VirtualBox version.

The vagrant box will have the default settings as recommended by the vagrant
website:
- hostname: vagrantup.com
- vagrant user: vagrant password vagrant
- root password: vagrant
- unsecure vagrant ssh keys installed for easy "vagrant ssh"
- puppet is installed (not Chef though)


