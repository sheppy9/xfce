# ##################################################
# Applications
# ##################################################
sudo apt update
sudo apt install -y nala git flameshot xfce4-whiskermenu-plugin catfish baobab curl net-tools file-roller gnome-calculator gnome-clocks remmina bspwm sxhkd
sudo apt install -y qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin virt-manager
sudo apt install -y ibus ibus-libthai ibus-pinyin

# ##################################################
# Keyboard shortcuts
# ##################################################
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>c' -s 'code'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>s' -s 'catfish'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>l' -s 'xflock4'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>n' -s 'mousepad'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>k' -s 'keepass2'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>y' -s 'freetube'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>v' -s 'virt-manager'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>f' -s 'xfce4-appfinder'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>r' -s 'remmina-file-wrapper'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super><Shift>s' -s 'flameshot gui'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>b' -s 'exo-open --launch WebBrowser'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Shift><Ctrl>Escape' -s 'xfce4-taskmanager'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>e' -s 'exo-open --launch FileManager'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Ctrl><Alt>Delete' -s 'xfce4-session-logout'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>t' -s 'exo-open --launch TerminalEmulator'

xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/xfwm4/custom/<Super>q' -s 'close_window_key'

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
xfconf-query -c xsettings -t 'string' -np '/Net/ThemeName' -s 'Adwaita-dark'
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
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-menu/show-delete' -s 'false'
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-icon/file-icons/show-filesystem' -s 'false'
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-icon/file-icons/show-home' -s 'false'
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-icon/file-icons/show-removable' -s 'false'

# Panels settings
xfconf-query -c xfc4-panel -t 'int' -np '/panels/panel-1/size' -s '40'
xfconf-query -c xfc4-panel -t 'string' -np '/panels/panel-1/position' -s 'p=0;x=0;y=2560'
xfconf-query -c xfc4-panel -t 'double' -np '/panels/panel-1/length' -s '100'

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
# sudo reboot now
