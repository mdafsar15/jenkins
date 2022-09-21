installDocker(){
if [ -x "$(command -v docker)" ]; then
    echo "Docker is already installed"
else
    echo "Installing docker"

    sudo apt update -y

    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

    sudo apt-get install docker-ce docker-ce-cli -y

    sudo groupadd docker 

    sudo usermod -aG docker $USER

    sudo service docker start
 
    docker version
fi
}

installCompose(){

if [ -x "$(command -v docker-compose)" ]; then
    echo "Docker-compose  already installed"
else
    echo "Installing docker-compose"

    sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

    sudo chmod +x /usr/local/bin/docker-compose

    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

    docker-compose version
fi
 }
#installDocker
installCompose