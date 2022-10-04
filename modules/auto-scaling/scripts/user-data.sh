#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>This is nginx with IP: $myip</h2><br>"  >  /var/www/html/index.html
sudo service httpd start
chkconfig httpd on

