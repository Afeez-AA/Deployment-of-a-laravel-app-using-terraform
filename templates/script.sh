#!/bin/bash

hostname=$(hostname)
date=$(date)

echo "<h1>Happy new month from the host $hostname</h1>" > /var/www/html/index.html
echo "<p>The current date and time is: $date</p>" >> /var/www/html/index.html


# #!/bin/bash
# sudo apt update -y
# sudo apt install nginx -y 
# sudo systemctl enable nginx
# sudo systemctl start nginx 
# hostnamectl set-hostname AFEEZ_WEB02
# timedatectl set-timezone Africa/Lagos
# hostname=$(hostname)
# date=$(date)
# sudo echo "<h1>Season's Greetings from the host $hostname</h1>" > /var/www/html/index.nginx-debian.html
# sudo echo "<p>The current date and time is: $date</p>" >> /var/www/html/index.nginx-debian.html
# sudo systemctl restart nginx
# sudo systemctl reload nginx