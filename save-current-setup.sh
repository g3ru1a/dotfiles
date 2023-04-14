#! /bin/bash

read -p "What's your home directory name: " username

title="Which template do you want to update?"
prompt="Pick an option: "
options=("saghen" "gerula")
selection="exit"
echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do
    case "$REPLY" in
    [1-2]) selection=$opt; break;;
    $((${#options[@]}+1))) echo "Goodbye!"; exit;;
    *) echo "Invalid option. Try another one.";continue;;
    esac
done

if [ "$selection" == "exit" ]; then
  exit;
fi

template="templates/$selection"
echo "Looking for $template"
if [ -f "$template"/post-setup.sh ]; then
  echo "Preparing to backup your current configuration..."

  username=$1
  dir="$PWD/templates/$selection"

  echo "Configuring the environment..."

  echo "Copying bspwm config"
  cp -r /home/"$username"/.config/bspwm "$dir"/.config/bspwm
  echo "Copying dunst config"
  cp -r /home/"$username"/.config/dunst "$dir"/.config/dunst
  echo "Copying kitty config"
  cp -r /home/"$username"/.config/kitty "$dir"/.config/kitty
  echo "Copying picom config"
  cp -r /home/"$username"/.config/picom "$dir"/.config/picom
  echo "Copying polybar config"
  cp -r /home/"$username"/.config/polybar "$dir"/.config/polybar
  echo "Copying rofi config"
  cp -r /home/"$username"/.config/rofi "$dir"/.config/rofi
  echo "Copying sxhkd config"
  cp -r /home/"$username"/.config/sxhkd "$dir"/.config/sxhkd

  echo "Copying scripts, styles and fonts"
  cp -r /home/"$username"/scripts "$dir"/scripts
  cp -r /home/"$username"/styling "$dir"/styling
  cp -r /home/"$username"/.fonts "$dir"/.fonts
  echo "Copying shell profile"
  cp /home/"$username"/.profile "$dir"/.profile
  cp /home/"$username"/.zshenv "$dir"/.zshenv
  cp /home/"$username"/.zshrc "$dir"/.zshrc
  echo "Copying Xresources"
  cp /home/"$username"/.Xresources "$dir"/.Xresources

  #Copy zsh theme
  cp /home/"$username"/.config/starship.toml "$dir"/.config/starship.toml

  echo "Removing profile name"
  sed -i "s/$username/<user>/" "$dir"/.profile
  sed -i "s/$username/<user>/" "$dir"/.zshenv

  xrandr --listactivemonitors
  # shellcheck disable=SC2162
  read -p "Removing main monitor [eg. HDMI-1]: " monitor
  sed -i "s/$monitor/<main-monitor>/" "$dir"/.profile



  echo "Copying X11 xkb symbols"
  sudo cp /usr/share/X11/xkb/symbols/pc "$dir"/scripts/usr-share-X11-xkb-symbols-pc

  echo "Save complete. Ready to commit o7 !"
else
  echo "Template not found. Aborting."
  exit
fi


