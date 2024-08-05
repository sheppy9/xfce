# ##################################################
# Install common utils
# ##################################################
sudo apt-get update
sudo apt-get install -y net-tools curl openssh-server

# ##################################################
# Install webmin
# ##################################################
# Login to webadmin using https://<ip_address>:10000
# username: <server_username>
# password: <server_password>
curl -o webmin.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh
chmod +x webmin.sh
sudo ./webmin.sh -f
sudo apt-get install -y webmin --install-recommends

# ##################################################
# Install docker
# ##################################################
sudo apt-get install -y ca-certificates
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sleep 5
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# ##################################################
# Install portainer
# ##################################################
# Login to portainer using https://<ip_address>:9443
sudo docker volume create portainer_data
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

# ##################################################
# APT cleanup
# ##################################################
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo apt-get -y autopurge
sudo apt-get remove --purge -y `dpkg -l | grep '^rc' | awk '{print $2}'`