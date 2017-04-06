apt-get -y update

apt-get -y install nginx

service nginx start

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt-get install -y nodejs

sudo npm install pm2 -g

sudo apt-get install git-core -y

sudo rm /etc/nginx/sites-available/default

sudo cp nginx.default /etc/nginx/sites-available/default

sudo  service nginx restart

echo "eval `ssh-agent -s`" >> ~/.bashrc
echo "ssh-add ~/.ssh/github"  >> ~/.bashrc
