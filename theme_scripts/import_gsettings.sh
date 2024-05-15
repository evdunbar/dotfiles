#!/bin/bash

config="$HOME/.gtkrc-2.0"
gtk_theme="$(grep 'gtk-theme-name' "$config" | sed 's/.*\s*=\s*//')"
icon_theme="$(grep 'gtk-icon-theme-name' "$config" | sed 's/.*\s*=\s*//')"
font_name="$(grep 'gtk-font-name' "$config" | sed 's/.*\s*=\s*//')"

gnome_schema="org.gnome.desktop.interface"
gsettings set $gnome_schema gtk-theme $(echo $gtk_theme)
gsettings set $gnome_schema icon-theme $(echo $icon_theme)
gsettings set $gnome_schema font-name $(echo $font_name)
