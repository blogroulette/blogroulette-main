#/bin/bash
# Setup MySQL Database and User (run as root)
set -x 

mysql -u root -e "CREATE DATABASE blogroulette;"
mysql -u root -e "CREATE USER blogroulette@localhost IDENTIFIED BY 'blogroulettedefaultpassword';"
mysql -u root -e "GRANT ALL PRIVILEGES ON blogroulette.* TO 'blogroulette'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"
