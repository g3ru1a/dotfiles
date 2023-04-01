#! /bin/bash

username=$1
dir="$PWD/templates/gerula"
echo "$PWD"

echo "Configuring the environment..."

cp -r "$dir"/.config/bspwm ~/.config/bspwm
cp -r "$dir"/.config/dunst ~/.config/dunst
cp -r "$dir"/.config/kitty ~/.config/kitty
cp -r "$dir"/.config/picom ~/.config/picom
cp -r "$dir"/.config/polybar ~/.config/polybar
cp -r "$dir"/.config/rofi ~/.config/rofi
cp -r "$dir"/.config/sxhkd ~/.config/sxhkd

cp -r "$dir"/scripts ~/
cp -r "$dir"/styling ~/
cp -r "$dir"/.fonts ~/
cp "$dir"/.profile ~/
cp "$dir"/.zshenv ~/
cp "$dir"/.zshrc ~/

sed -i "s/<user>/$username/" ~/.profile
sed -i "s/<user>/$username/" ~/.zshenv

sudo rm -rf /usr/share/X11/xkb/symbols/pc
sudo touch /usr/share/X11/xkb/symbols/pc
cat ./scritps/usr-share-X11-xkb-symbols-pc >> /usr/share/X11/xkb/symbols/pc

