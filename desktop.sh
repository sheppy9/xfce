# ##################################################
# Debian minimal installation setup
# ##################################################
# NOTE: install without root account
sudo apt install nala wget curl -y
sudo nala install xfce4-session xfce4-terminal -y

# ##################################################
# Sudo setup
# ##################################################
# Run the following to add "linux" to sudo if default "root" account is created
# su -
# -- Type password
# echo "linux    ALL=(ALL:ALL) ALL" | sudo tee /etc/sudoers.d/my-sudoers
# chmod 440 /etc/sudoers.d/my-sudoers
# exit

# Repo setup

# - Vivaldi
# curl -fsSL https://repo.vivaldi.com/stable/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/vivaldi-archive-keyring.gpg
# echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vivaldi-archive-keyring.gpg] https://repo.vivaldi.com/stable/deb/ stable main" | sudo tee /etc/apt/sources.list.d/vivaldi.list

# - Firefox
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo -e 'Package: *\nPin: origin packages.mozilla.org\nPin-Priority: 1000' | sudo tee /etc/apt/preferences.d/mozilla

# ##################################################
# Applications
# ##################################################
sudo nala update && sudo apt-get update
# Default xfce4 packages
sudo nala install xfwm4 xfce4-appfinder xfconf xfce4-panel xfce4-power-manager xfce4-settings xfce4-notifyd xfce4-panel-profiles xfce4-taskmanager -y
# Utilities
sudo nala install firefox-devedition thunar tumbler thunar-volman catfish ristretto parole gedit xcape -y
# xfce plugins
sudo nala install xfce4-clipman-plugin xfce4-datetime-plugin xfce4-diskperf-plugin xfce4-fsguard-plugin xfce4-mount-plugin xfce4-mpc-plugin xfce4-systemload-plugin xfce4-timer-plugin xfce4-whiskermenu-plugin -y
# Themes
sudo nala install arc-theme -y
# Other interested packages
sudo nala install git flameshot keepassxc baobab net-tools file-roller gnome-calculator gnome-clocks remmina bspwm sxhkd -y
sudo nala install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin virt-manager -y
sudo nala install ibus ibus-libthai ibus-pinyin -y
# sudo nala install vivaldi-stable -y

# ##################################################
# Applications (via .deb)
# ##################################################
DEB_FILES=(
	"vscode https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
	"warp-terminal https://app.warp.dev/download?package=deb"
	"rambox https://rambox.app/api/download?os=linux&package=deb"
	"ms-edge https://go.microsoft.com/fwlink?linkid=2149051&brand=M102"
)

for file in "${DEB_FILES[@]}"; do
	name=$(echo "$file" | cut -d' ' -f1)
	url=$(echo "$file" | cut -d' ' -f2-)
	wget -O "$name.deb" "$url"
	sudo nala install "$name.deb" -y
	rm "$name.deb"
done

# Other manual download apps
# - Gradle
# - Dropbox

# ##################################################
# Java JDK (optional)
# ##################################################
# echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list
# wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
# sudo nala install apt-transport-https gpg temurin-8-jdk temurin-11-jdk temurin-17-jdk temurin-21-jdk -y

# ##################################################
# Assets
# ##################################################
image_names=(
	"assets/images/plasma-workspace-wallpapers-flow-5120x2880.jpg"
	"assets/images/plasma-workspace-wallpapers-elaran-2560x1600.png"
	"assets/images/luffy-gear-6-5000x2812.png"
	"assets/configs/xfce4-panel-config.tar.bz2"
)

for image_name in "${image_names[@]}"; do
	sudo curl -L -o "/usr/share/images/desktop-base/${image_name}" "https://github.com/sheppy9/xfce/raw/master/${image_name}"
done

# ##################################################
# Keyboard shortcuts
# ##################################################
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>c' -s 'code'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>f' -s 'catfish'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>l' -s 'xflock4'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>n' -s 'gedit'
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
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Ctrl>Escape' -s 'xfce4-popup-whiskermenu'

xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/xfwm4/custom/<Super>q' -s 'close_window_key'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/xfwm4/custom/<Super>d' -s 'show_desktop_key'

# Required to configure Windows button to open whiskermenu without clashing other windows + <key> shortcut
/usr/bin/xcape -e 'Super_L=Control_L|Escape'

# ##################################################
# Panel
# ##################################################
# Required to update python gi module
sudo apt-get --reinstall install python3-gi
xfce4-panel-profiles load xfce4-panel-config.tar.bz2

# ##################################################
# Language
# ##################################################
# # Setting Keyboard method input system to ibus
# im-config -n ibus
# # Adding 'pinyin' and 'libthai' to input methods
# gsettings set org.freedesktop.ibus.general preload-engines "['xkb:us::eng', 'pinyin', 'libthai']"
# # Start the ibus daemon. daemonize and replace if found existing
# ibus-daemon -dr
# # Restart ibus
# ibus restart

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
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-menu/show-delete' -s 'false'
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-icons/file-icons/show-home' -s 'false'
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-icons/file-icons/show-trash' -s 'false'
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-icons/file-icons/show-removable' -s 'false'
xfconf-query -c xfce4-desktop -t 'bool' -np '/desktop-icons/file-icons/show-filesystem' -s 'false'
xfconf-query -c xfce4-desktop -t 'string' -np '/backdrop/screen0/monitor0/workspace0/last-image' -s '/usr/share/images/desktop-base/plasma-workspace-wallpapers-flow-5120x2880.jpg'

# Reload desktop
xfdesktop --quit && xfdesktop &

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

# ##################################################
# APT cleanup
# ##################################################
sudo nala update
sudo nala upgrade -y
sudo nala autoremove -y
sudo nala autopurge -y

# ##################################################
# Reboot
# ##################################################
# echo "Reboot is required. Enter password to reboot"
sudo reboot now
