#! /bin/bash

username=$1
dir="$PWD/templates/gerula"

echo "Configuring the environment..."

echo "Copying bspwm config"
cp -r "$dir"/.config/bspwm ~/.config/bspwm
echo "Copying dunst config"
cp -r "$dir"/.config/dunst ~/.config/dunst
echo "Copying kitty config"
cp -r "$dir"/.config/kitty ~/.config/kitty
echo "Copying picom config"
cp -r "$dir"/.config/picom ~/.config/picom
echo "Copying polybar config"
cp -r "$dir"/.config/polybar ~/.config/polybar
echo "Copying rofi config"
cp -r "$dir"/.config/rofi ~/.config/rofi
echo "Copying sxhkd config"
cp -r "$dir"/.config/sxhkd ~/.config/sxhkd

echo "Copying scripts, styles and fonts"
cp -r "$dir"/scripts ~/
cp -r "$dir"/styling ~/
cp -r "$dir"/.fonts ~/
echo "Copying shell profile"
cp "$dir"/.profile ~/
cp "$dir"/.zshenv ~/
cp "$dir"/.zshrc ~/

echo "Updating profile name"
sed -i "s/<user>/$username/" ~/.profile
sed -i "s/<user>/$username/" ~/.zshenv

echo "Updating X11 xkb symbols"
sudo rm -rf /usr/share/X11/xkb/symbols/pc
sudo cp "$dir"/scripts/usr-share-X11-xkb-symbols-pc /usr/share/X11/xkb/symbols/
sudo mv /usr/share/X11/xkb/symbols/usr-share-X11-xkb-symbols-pc /usr/share/X11/xkb/symbols/pc

echo "Setup Complete! Reboot and login in bspwm."