#pull down new code

cd ~/app
git pull
sudo npm install
pm2 restart app
pm2 stop app
pm2 start app.js
