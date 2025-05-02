# Function to wait for the lock to be released
wait_for_lock() {
	while sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do
		echo "Waiting for other apt-get process to finish..."
		sleep 5
	done
}

# ##################################################
# Install common utils
# ##################################################
wait_for_lock
sudo apt-get update
wait_for_lock
sudo apt-get install -y net-tools curl openssh-server fuse3

# ##################################################
# Install webmin
# ##################################################
# Login to webadmin using https://<ip_address>:10000
# username: <server_username>
# password: <server_password>
wget -O webmin.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh
chmod +x webmin.sh
sudo ./webmin.sh -f
wait_for_lock
sudo apt-get install -y webmin --install-recommends

# ##################################################
# Install docker
# ##################################################
# wait_for_lock
# sudo apt-get install -y ca-certificates
# sudo install -m 0755 -d /etc/apt/keyrings
# sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
# sudo chmod a+r /etc/apt/keyrings/docker.asc
# sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# wait_for_lock
# sudo apt-get update
# wait_for_lock
# sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# ##################################################
# APT cleanup
# ##################################################
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo apt-get -y autopurge
sudo apt-get remove --purge -y `dpkg -l | grep '^rc' | awk '{print $2}'`

sudo rm server.sh
sudo rm webmin.sh