#!/bin/bash

apt-get update -y
apt-get install mysql-server -y
systemctl restart mysql
systemctl enable mysql