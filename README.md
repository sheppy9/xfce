# Scripts
- [Desktop](desktop.sh)
	- curl: `curl -O https://raw.githubusercontent.com/sheppy9/xfce/master/desktop.sh`
- [Server](server.sh)
	- curl: `curl -O https://raw.githubusercontent.com/sheppy9/xfce/master/server.sh`

## Setup
```bash
# Desktop setup script
chmod 775 desktop.sh && ./desktop.sh

# Server setup script
chmod 775 server.sh && ./server.sh
```

# Desktop shortcuts
```bash
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>c' -s 'code'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>f' -s 'catfish'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>l' -s 'xflock4'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>n' -s 'mousepad'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>k' -s 'keepass2'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>y' -s 'freetube'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>v' -s 'virt-manager'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>s' -s 'xfce4-appfinder'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>r' -s 'remmina-file-wrapper'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super><Shift>s' -s 'flameshot gui'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>b' -s 'exo-open --launch WebBrowser'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Shift><Ctrl>Escape' -s 'xfce4-taskmanager'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>e' -s 'exo-open --launch FileManager'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Ctrl><Alt>Delete' -s 'xfce4-session-logout'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>t' -s 'exo-open --launch TerminalEmulator'

xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/xfwm4/custom/<Super>q' -s 'close_window_key'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/xfwm4/custom/<Super>d' -s 'show_desktop_key'
```

# Setting up rclone for box.com
```bash
# Install rclone in both server and local machine (for authentication)
# https://rclone.org/install/#linux-precompiled

curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
cd rclone-*-linux-amd64
sudo cp rclone /usr/bin/
sudo chown root:root /usr/bin/rclone
sudo chmod 755 /usr/bin/rclone

# Configure box, use local authentication in the last step to authenticate in local machine
rclone config

# Configuration in server
sudo nano /etc/systemd/system/rclone-box.service
sudo systemctl daemon-reload
sudo systemctl enable rclone-box.service
sudo systemctl start rclone-box.service
sudo systemctl status rclone-box.service

sudo journalctl -u rclone-box
sudo tail /var/log/rclone-box-output.log
sudo tail /var/log/rclone-box-error.log

# ==============================
# Service file
# ==============================
[Unit]
Description=Mount Box.com using rclone
After=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/rclone --vfs-cache-mode writes mount "box": /home/linux/box --allow-non-empty
# Check "which fusermount" path
ExecStop=/usr/bin/fusermount -u /home/linux/box
Restart=always
RestartSec=10
User=linux
StandardOutput=file:/var/log/rclone-box-output.log
StandardError=file:/var/log/rclone-box-error.log

[Install]
WantedBy=multi-user.target
```

## Minimal packages
- [Application Finder](https://docs.xfce.org/xfce/xfce4-appfinder/start)
- [Catfish](https://docs.xfce.org/apps/catfish/start)
- [Flameshot](https://flameshot.org)
- [Gedit](https://gedit-technology.github.io/apps/gedit/)
- [Gnome Disk Usage Analyzer](https://flathub.org/apps/org.gnome.baobab)
- [Gnome Disks](https://apps.gnome.org/en-GB/DiskUtility/)
- [Libre Office](https://www.libreoffice.org)
- [Microsoft Edge](https://www.microsoft.com/en-us/edge)
- [Nano](https://www.nano-editor.org)
- [Nautilus](https://apps.gnome.org/en-GB/Nautilus/)
- [Okular](https://okular.kde.org)
- [Remmina](https://remmina.org)
- [Ristretto](https://docs.xfce.org/apps/ristretto/start)
- [System Monitor](https://apps.gnome.org/en-GB/SystemMonitor/)
- [VLC](https://www.videolan.org)
- [Vivaldi](https://vivaldi.com)