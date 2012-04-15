
# Install Mongodb
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee --append /etc/apt/sources.list
sudo apt-get update 
sudo apt-get install mongodb-10gen

# Install git
sudo apt-get install git

# Install Haibu
npm install -g coffee-script
npm install -g haibu

echo """
start on startup
stop on shutdown
respawn
respawn limit 10 5

script
    NODE_ENV="production" haibu --coffee
end script
"""  | sudo tee --append /etc/init/paas.conf
sudo service paas start

# install home

git clone https://bitbucket.org/gelnior/cozy-setup.git
cd cozy-setup
npm install eyes
npm install haibu
coffee home.coffee
coffee notes.coffee
coffee proxy.coffee


