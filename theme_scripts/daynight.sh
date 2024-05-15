#!/bin/bash

theme_dir=$HOME/Code/os/theming
current_theme=$(bat $theme_dir/current_theme.txt)

if [[ $current_theme == "dark" ]] ; then
    next_theme="light"
elif [[ $current_theme == "light" ]] ; then
    next_theme="dark"
else
    exit 1
fi

# run wal script to change colors and generate files
bash $theme_dir/wal_$next_theme.sh

# get bash variables created by wal
# namely, $wallpaper
source $HOME/.cache/wal/colors.sh

# change wallpaper
swww img -t none $wallpaper

# make gtk settings match
bash $theme_dir/gtk_$next_theme.sh
bash $theme_dir/import_gsettings.sh

# put eww bar back above wallpaper
eww reload

# update pywalfox colors and light/dark setting
pywalfox update
pywalfox $next_theme

# update notifications to match
makoctl reload

# set variables in neovim config to make colorscheme change
lua_file=$XDG_CONFIG_HOME/nvim/lua/bg.lua
echo "vim.g.background = '$next_theme'" > $lua_file
echo "vim.o.background = '$next_theme'" >> $lua_file

# make sure next theme now accurately reflects the new current theme
echo $next_theme > $theme_dir/current_theme.txt
