#! /bin/bash

username=$1
dir="$PWD/templates/gerula"

echo "Configuring the environment..."

echo "Copying bspwm config"
cp -r "$dir"/.config/bspwm /home/"$username"/.config/bspwm
echo "Copying dunst config"
cp -r "$dir"/.config/dunst /home/"$username"/.config/dunst
echo "Copying kitty config"
cp -r "$dir"/.config/kitty /home/"$username"/.config/kitty
echo "Copying picom config"
cp -r "$dir"/.config/picom /home/"$username"/.config/picom
echo "Copying polybar config"
cp -r "$dir"/.config/polybar /home/"$username"/.config/polybar
echo "Copying rofi config"
cp -r "$dir"/.config/rofi /home/"$username"/.config/rofi
echo "Copying sxhkd config"
cp -r "$dir"/.config/sxhkd /home/"$username"/.config/sxhkd

echo "Copying scripts, styles and fonts"
cp -r "$dir"/scripts /home/"$username"/scripts
cp -r "$dir"/styling /home/"$username"/styling
cp -r "$dir"/.fonts /home/"$username"/.fonts
echo "Copying shell profile"
cp "$dir"/.profile /home/"$username"/.profile
cp "$dir"/.zshenv /home/"$username"/.zshenv
cp "$dir"/.zshrc /home/"$username"/.zshrc

echo "Updating profile name"
sed -i "s/<user>/$username/" /home/"$username"/.profile
sed -i "s/<user>/$username/" /home/"$username"/.zshenv

xrandr --listactivemonitors
# shellcheck disable=SC2162
read -p "Specify main monitor [eg. HDMI-1]: " monitor
sed -i "s/<main-monitor>/$monitor/" /home/"$username"/.profile

#Copy zsh theme
cp "$dir"/.config/starship.toml /home/"$username"/.config/starship.toml
chsh -s /bin/zsh

echo "Updating X11 xkb symbols"
sudo rm -rf /usr/share/X11/xkb/symbols/pc
sudo cp "$dir"/scripts/usr-share-X11-xkb-symbols-pc /usr/share/X11/xkb/symbols/
sudo mv /usr/share/X11/xkb/symbols/usr-share-X11-xkb-symbols-pc /usr/share/X11/xkb/symbols/pc

echo "Setup Complete! Reboot and login in bspwm."
