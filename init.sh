# ##################################################
# Keyboard shortcuts
# ##################################################
echo "Setting keyboard shortcuts"
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>c' -s 'catfish'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>e' -s 'exo-open --launch FileManager'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>t' -s 'exo-open --launch TerminalEmulator'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>b' -s 'exo-open --launch WebBrowser'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>f' -s 'xfce4-appfinder'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Ctrl><Alt>Delete' -s 'xfce4-session-logout'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Shift><Ctrl>Escape' -s 'xfce4-taskmanager'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super><Shift>s' -s 'flameshot gui'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>l' -s 'xflock4'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>r' -s 'remmina-file-wrapper'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Ctrl>Escape' -s 'xfce4-popup-zorinmenulite'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>n' -s 'gedit --new-window'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>a' -s 'baobab'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>g' -s 'gnome-disks'
echo "Setting keyboard shortcuts completed"

# ##################################################
# Applications
# ##################################################
sudo apt update
sudo apt -y upgrade

sudo apt install -y git
sudo apt install -y flameshot
sudo apt install -y ibus
sudo apt install -y ibus-libthai
sudo apt install -y ibus-pinyin

# Other manual download apps
# - Vivaldi
# - Microsoft Edge
# - Obsidian
# - VSCode
# - pCloud

# ##################################################
# Application Configurations
# ##################################################

# Language
# ##################################################
# Setting Keyboard method input system to ibus
im-config -n ibus
# Adding 'pinyin' and 'libthai' to input methods
gsettings set org.freedesktop.ibus.general preload-engines "['xkb:us::eng', 'pinyin', 'libthai']"
# Start the ibus daemon. daemonize and replace if found existing
ibus-daemon -dr
# Restart ibus
ibus restart

# ##################################################
# APT cleanup
# ##################################################
sudo apt autoremove
sudo apt autopurge

# ##################################################
# Reboot
# ##################################################
# echo "Reboot is required. Enter password to reboot"
# sudo reboot now