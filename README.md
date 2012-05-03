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
