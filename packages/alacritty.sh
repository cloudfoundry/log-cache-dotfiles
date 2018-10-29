#!/bin/bash

. ~/workspace/log-cache-dotfiles/support/helpers.sh

APP="Alacritty"
VERSION=0.2.1

echo_installing

if [[ `alacritty --version` = "alacritty $VERSION" ]]; then
    echo_already_installed
    exit
fi

sudo apt-get update
sudo apt-get install -y cmake libfreetype6-dev libfontconfig1-dev xclip

within_temp_dir
  wget https://github.com/jwilm/alacritty/archive/v$VERSION.zip
  unzip v$VERSION.zip
  cd alacritty-$VERSION
  cargo build --release
  sudo cp target/release/alacritty /usr/local/bin
  sudo desktop-file-install alacritty.desktop
  sudo update-desktop-database
end_temp_dir

echo_installed
