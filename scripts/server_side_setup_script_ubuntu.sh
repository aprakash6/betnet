sudo apt-get update
sudo apt-get install -y apache2
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password betnet'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password betnet'
sudo apt-get install -y mysql-server
sudo apt-get install -y python-pip
sudo pip install -U pip
sudo apt-get install -y python-dev libmysqlclient-dev
sudo pip install MySQL-python
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

#Create a Database
mysql -u root -pbetnet -e "CREATE DATABASE BETNET;"
mysql -u root -pbetnet -e "use BETNET; CREATE TABLE USERS (email VARCHAR(40), name VARCHAR(40), pwd VARCHAR(40), uid INT);"
mysql -u root -pbetnet -e "use BETNET; INSERT INTO USERS VALUES ('adi@gmail.com', 'adi', 'adi123', 1);" 
mysql -u root -pbetnet -e "use BETNET; INSERT INTO USERS VALUES ('roh@gmail.com', 'roh', 'roh123', 2);" 
mysql -u root -pbetnet -e "GRANT ALL PRIVILEGES ON BETNET.* TO 'root'@'%' IDENTIFIED BY 'betnet';" 
mysql -u root -pbetnet -e "flush priveleges;" 
mysql -u root -pbetnet -e "select * from USERS;" 
#mysql -u root -pbetnet -e "" 

# Install flask and flask socetIO
sudo apt-get install -y python python-pip python-virtualenv nginx gunicorn
sudo pip install flask
sudo pip install flask-socketio

# Setup mongo database and the various collections
sh mongo_setup.sh
