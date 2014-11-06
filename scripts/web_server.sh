# Update
apt-get update

# Installing MariaDB Client and Utilities
apt-get install -y  mariadb-client libmariadbclient18 python-dev

# Installing VirtualEnv and pip utilities
apt-get install -y python-virtualenv python-pip 

# Creating Django virtualenv
mkdir /srv/www
cd /srv/www
virtualenv django
source django/bin/activate
apt-get install -y python-mysqldb
pip install django

# Cloning Django Sample project
apt-get install -y git
git clone https://github.com/obedmr/django_sample

# Adding DB server hostname
echo "10.0.0.11  dbserver" >> /etc/hosts

# Installing Apache Server
apt-get install -y apache2 

# Installing WSGI module for connecting Django app with Apache
apt-get install -y libapache2-mod-wsgi

# Configuring wsgi 
echo "Include django.conf" >> /etc/apache2/apache2.conf

cat >> /etc/apache2/django.conf << EOL

WSGIScriptAlias / /srv/www/django_sample/django_sample/wsgi.py
WSGIPythonPath /srv/www/django/lib/python2.7/site-packages

<Directory /srv/www/django_sample>
  <Files wsgi.py>
    Order deny,allow
    Require all granted
  </Files>
</Directory>
EOL

# Change permissions 
chmod 755 -R /srv/www
chown -R www-data /srv/www/

# Re-Starting Apache Service
service apache2 restart
