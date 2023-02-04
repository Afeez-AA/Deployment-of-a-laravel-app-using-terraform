#!/bin/bash
hostname=$(hostname)
date=$(date)

echo "<h1>Happy new month and welcome to the best month of the year from $hostname</h1>" > /var/www/html/index.html
echo "<p>The current date and time is: $date</p>" >> /var/www/html/index.html
