#!/bin/bash

gtk2_path=$HOME/.gtkrc-2.0
gtk3_path=$XDG_CONFIG_HOME/gtk-3.0/settings.ini
xsettingsd_path=$HOME/.xsettingsd

gtk3_prefix='[Settings]'
base_name=WhiteSur

theme_suffix='-Light'
font='SF Pro Text 15'

echo gtk-theme-name = \"$base_name$theme_suffix\" > $gtk2_path
echo gtk-icon-theme-name = \"$base_name\" >> $gtk2_path
echo gtk-font-name = \"$font\" >> $gtk2_path

echo $gtk3_prefix > $gtk3_path
echo gtk-theme-name=Adwaita >> $gtk3_path
cat $gtk2_path >> $gtk3_path
echo gtk-application-prefer-dark-theme = false >> $gtk3_path

gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

echo Net/ThemeName \"$base_name$theme_suffix\" > $xsettingsd_path
echo Net/IconThemeName \"$base_name\" >> $xsettingsd_path
killall -HUP xsettingsd
