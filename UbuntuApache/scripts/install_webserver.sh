#!/bin/bash

apt-get update -y
apt-get install apache2 certbot python3-certbot-apache -y
a2enmod rewrite
a2enmod ssl
a2enmod headers
systemctl restart apache2
systemctl enable apache2