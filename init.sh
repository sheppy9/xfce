# ##################################################
# System Theme
# ##################################################
echo "Setting system theme"
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita"
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

# ##################################################
# Terminal
# ##################################################
rm -f ~/.config/xfce4/terminal/terminalrc
mkdir -p ~/.config/xfce4/terminal
echo "[Configuration]" >> ~/.config/xfce4/terminal/terminalrc
echo "ColorCursor=#ffffff" >> ~/.config/xfce4/terminal/terminalrc
echo "ColorPalette=#000000;#aa0000;#44aa44;#aa5500;#0039aa;#aa22aa;#1a92aa;#aaaaaa;#777777;#ff8787;#4ce64c;#ded82c;#295fcc;#cc58cc;#4ccce6;#ffffff" >> ~/.config/xfce4/terminal/terminalrc
echo "FontName=JetBrains Mono 10" >> ~/.config/xfce4/terminal/terminalrc
echo "FontUseSystem=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscAlwaysShowTabs=FALSE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscBell=FALSE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscBellUrgent=FALSE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscBordersDefault=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscCursorBlinks=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscCursorShape=TERMINAL_CURSOR_SHAPE_IBEAM" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscDefaultGeometry=80x24" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscInheritGeometry=FALSE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscMenubarDefault=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscMouseAutohide=FALSE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscMouseWheelZoom=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscToolbarDefault=FALSE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscConfirmClose=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscCycleTabs=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscTabCloseButtons=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscTabCloseMiddleClick=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscTabPosition=GTK_POS_TOP" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscHighlightUrls=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscMiddleClickOpensUri=FALSE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscCopyOnSelect=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscShowRelaunchDialog=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscRewrapOnResize=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscUseShiftArrowsToScroll=FALSE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscSlimTabs=FALSE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscNewTabAdjacent=FALSE" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscSearchDialogOpacity=100" >> ~/.config/xfce4/terminal/terminalrc
echo "MiscShowUnsafePasteDialog=TRUE" >> ~/.config/xfce4/terminal/terminalrc
echo "TabActivityColor=#0f4999" >> ~/.config/xfce4/terminal/terminalrc