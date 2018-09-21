#!/bin/bash
# Author: Mahesh Sharma (ZEROCOOL)
sudo yum install -y lvm2
sudo yum install -y httpd git
pvscan
lvscan
lvchange -a y /dev/datavg/datavol
mkfs.ext4 /dev/datavg/datavol
echo "/dev/datavg/datavol /var/www/html ext4 defaults 0 0" >> /etc/fstab
mount -a  

sudo systemctl start httpd
sudo systemctl enable httpd
