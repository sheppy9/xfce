# Scripts
- [Workstation](workstation.sh)
- [Server](server.sh)

## Setup
```bash
# Workstation setup script
chmod 775 workstation.sh && ./workstation.sh

# Server setup script
chmod 775 server.sh && ./server.sh
```

# Workstation shortcuts
```bash
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>c' -s 'code'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>n' -s 'gedit'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>s' -s 'catfish'
xfconf-query -c xfce4-keyboard-shortcuts -t 'string' -np '/commands/custom/<Super>l' -s 'xflock4'
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