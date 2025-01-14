#! /bin/bash
# shellcheck disable=SC2162
echo "Running pacman update"
sudo pacman -Syu

read -p "Do you have 'yay' already installed? [Y/n]: " response

if [ "$response" == "n" ] || [ "$response" == "N" ]; then
    echo "Installing yay..."
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit
    makepkg -si
fi

echo "Installing dependencies..."
yay -S antigen starship polybar lsd fasd github-cli \
      bspwm sxhkd xorg-xev xdo xorg-xrandr \
      xorg-xmodmap ripgrep polkit-gnome mpv picom flameshot \
      dunst mailspring cava kitty yadm ttf-icomoon-feather \
      noto-fonts noto-fonts-emoji noto-fonts-extra \
      ttf-noto-nerd rofi twitch-cli-git jq xdotool
retval=$?
if [ $retval -eq 0 ];then
  echo "Successfully installed yay dependencies"
else
  echo "Something went wrong."
  exit
fi

sudo pacman -S feh playerctl
retval=$?
if [ $retval -eq 0 ];then
  echo "Successfully installed pacman dependencies"
else
  echo "Something went wrong."
  exit
fi

read -p "What's your account user name? [user]: " username

echo "Preparing BSPWM for $username"

title="Available Setups"
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
  echo "Loading $template..."
  sudo chmod +x ./"$template"/post-setup.sh
  ./"$template"/post-setup.sh "$username"
else
  echo "Template not found. Aborting."
  exit
fi
