# ##################################################
# Debian minimal installation setup
# ##################################################
# NOTE: install without root account
sudo apt install -y xfce4-session xfce4-terminal firefox-esr

# ##################################################
# Sudo setup
# ##################################################
# Run the following to add "linux" to sudo if default "root" account is created
# su -
# -- Type password
# echo "linux    ALL=(ALL:ALL) ALL" | sudo tee /etc/sudoers.d/my-sudoers
# chmod 440 /etc/sudoers.d/my-sudoers
# exit

# ##################################################
# Applications
# ##################################################
sudo apt update
# Default xfce4 packages
sudo apt install -y xfwm4 xfce4-appfinder xfconf xfce4-panel xfce4-power-manager xfce4-settings xfce4-notifyd xfce4-panel-profiles xfce4-taskmanager
# Utilities
sudo apt install -y thunar tumbler thunar-volman catfish ristretto parole notepadqq
# xfce plugins
sudo apt install -y xfce4-clipman-plugin xfce4-datetime-plugin xfce4-diskperf-plugin xfce4-fsguard-plugin xfce4-mount-plugin xfce4-mpc-plugin xfce4-systemload-plugin xfce4-timer-plugin xfce4-whiskermenu-plugin
# Themes
sudo apt install -y arc-theme
# Other interested packages
sudo apt install -y nala git flameshot baobab curl net-tools file-roller gnome-calculator gnome-clocks remmina bspwm sxhkd
sudo apt install -y qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin virt-manager
sudo apt install -y ibus ibus-libthai ibus-pinyin

# ##################################################
# Assets
# ##################################################
sudo curl -L -o /usr/share/images/desktop-base/plasma-workspace-wallpapers-flow-5120x2880.jpg https://github.com/sheppy9/xfce/raw/master/assets/plasma-workspace-wallpapers-flow-5120x2880.jpg
sudo curl -L -o /usr/share/images/desktop-base/plasma-workspace-wallpapers-elaran-2560x1600.png https://github.com/sheppy9/xfce/raw/master/assets/plasma-workspace-wallpapers-elaran-2560x1600.png

# ##################################################
# Keyboard shortcuts
# ##################################################
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

# Other manual download apps
# - Vivaldi
# - Microsoft Edge
# - VSCode
# - Warp terminal
# - Rambox
# - Freetube
# - Gradle
# - Java
# - Dropbox

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
# OS configuration
# ##################################################
# Theme
xfconf-query -c xsettings -t 'string' -np '/Net/ThemeName' -s 'Arc-Dark'
xfconf-query -c xsettings -t 'string' -np '/Net/IconThemeName' -s 'Adwaita'

# Thunar
xfconf-query -c thunar -t 'string' -np '/last-details-view-zoom-level' -s 'THUNAR_ZOOM_LEVEL_25_PERCENT'
xfconf-query -c thunar -t 'string' -np '/default-view' -s 'ThunarDetailsView'
xfconf-query -c thunar -t 'string' -np '/misc-date-style' -s 'THUNAR_DATE_STYLE_LONG'
xfconf-query -c thunar -t 'string' -np '/shortcuts-icon-size' -s 'THUNAR_ICON_SIZE_16'
xfconf-query -c thunar -t 'bool' -np '/misc-open-new-window-as-tab' -s 'true'
xfconf-query -c thunar -t 'bool' -np '/misc-full-path-in-tab-title' -s 'true'

# App-Finder
xfconf-query -c xfce4-appfinder -t 'bool' -np '/always-center' -s 'true'
xfconf-query -c xfc4-appfinder -t 'int' -np '/item-icon-size' -s '0'

# Desktop
sudo curl -o /usr/share/images/desktop-base/my-desktop.jpg https://raw.githubusercontent.com/sheppy9/xfce/master/assets/my-desktop.jpg
sudo chmod 644 /usr/share/images/desktop-base/my-desktop.jpg

xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-menu/show-delete' -s 'false'
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-icons/file-icons/show-home' -s 'false'
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-icons/file-icons/show-trash' -s 'false'
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-icons/file-icons/show-removable' -s 'false'
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-icons/file-icons/show-filesystem' -s 'false'
xfconf-query -c xfce4-desktop -t 'string' -np '/backdrop/screen0/monitor0/workspace0/last-image' -s '/usr/share/images/desktop-base/my-desktop.jpg'

# Reload desktop
xfdesktop --quit && xfdesktop &

# Panels settings
curl -o ~/Downloads/xfce4-panel-profiles.tar.bz2 https://raw.githubusercontent.com/sheppy9/xfce/master/assets/xfce4-panel-profiles.tar.bz2
xfce4-panel-profiles load ~/Downloads/xfce4-panel-profiles.tar.bz2
rm ~/Downloads/xfce4-panel-profiles.tar.bz2

# Power Manager
xfconf-query -c xfc4-power-manager -t 'int' -np '/xfce4-power-manager/power-button-action' -s '4'
xfconf-query -c xfc4-power-manager -t 'int' -np '/xfce4-power-manager/blank-on-ac' -s '0'
xfconf-query -c xfc4-power-manager -t 'bool' -np '/xfce4-power-manager/dpms-enabled' -s 'false'

# Screensaver
xfconf-query -c xfce4-screensaver -t 'bool' -np '/saver/enabled' -s 'false'

# Session
xfconf-query -c xfce4-session -t 'bool' -np '/general/SaveOnExit' -s 'false'

# Terminal
xfconf-query -c xfce4-terminal -t 'string' -np '/misc-cursor-shape' -s 'TERMINAL_CURSOR_SHAPE_IBEAM'
xfconf-query -c xfce4-terminal -t 'bool' -np '/misc-cursor-blinks' -s 'true'
xfconf-query -c xfce4-terminal -t 'bool' -np '/misc-copy-on-select' -s 'true'

# Window Manager
xfconf-query -c xfwm4 -t 'int' -np '/general/cycbel-tabwin-mode' -s '1'
xfconf-query -c xfwm4 -t 'bool' -np '/general/cycle_raise' -s 'true'
xfconf-query -c xfwm4 -t 'bool' -np '/general/cycle_workspaces' -s 'true'
xfconf-query -c xfwm4 -t 'bool' -np '/general/cycle_minimized' -s 'true'
xfconf-query -c xfwm4 -t 'string' -np '/general/activate_action' -s 'switch'
xfconf-query -c xfwm4 -t 'string' -np '/general/placeholder_mode' -s 'center'
xfconf-query -c xfwm4 -t 'string' -np '/general/title_alignment' -s 'left'

# xfconf-query -c xsettings -t 'string' -np '' -s ''
# xfconf-query -c xsettings -t 'int' -np '' -s ''
# xfconf-query -c xsettings -t 'double' -np '' -s ''
# xfconf-query -c xsettings -t 'bool' -np '' -s ''

git config --global user.name "kaiying"
git config --global user.email kaiying1991@hotmail.com

# ##################################################
# APT cleanup
# ##################################################
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt -y autoclean
sudo apt -y autopurge
sudo apt-get remove --purge -y `dpkg -l | grep '^rc' | awk '{print $2}'`

# ##################################################
# Reboot
# ##################################################
# echo "Reboot is required. Enter password to reboot"
sudo reboot now
