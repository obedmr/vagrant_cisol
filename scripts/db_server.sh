# Update 
apt-get update 

# Installing MariaDB Server
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password secure"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password secure"
apt-get install -y mariadb-server mariadb-client

# Enable Remote client access
cat /etc/mysql/my.cnf | grep  -v "bind-address" > /etc/mysql/my.cnf
service mariadbd restart

# Creating Django Sample DB
mysql -u root -psecure -e "CREATE DATABASE django_sample;"
mysql -u root -psecure -e "GRANT ALL ON django_sample.* TO 'django_user'@'%' IDENTIFIED BY 'supersecure';"
