#!/bin/bash
sudo yum install -y lvm2
sudo yum install -y httpd git
pvcreate /dev/xvdb  /dev/xvdc
vgcreate  datavg /dev/xvdb /dev/xvdc
lvcreate -L +2.5G -n datavol datavg
mkfs.ext4 /dev/datavg/datavol
echo "/dev/datavg/datavol /var/www/html ext4 defaults 0 0" >> /etc/fstab
mount -a  
git clone https://github.com/mohanraj81/webtet /var/www/html
sudo systemctl start httpd
sudo systemctl enable httpd
