# ##################################################
# System Theme
# ##################################################
echo "Setting system theme"
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
echo "Setting system theme completed"

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
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>r' -s 'xfrun4'
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Ctrl>Escape' -s 'xfce4-popup-zorinmenulite'
echo "Setting keyboard shortcuts completed"