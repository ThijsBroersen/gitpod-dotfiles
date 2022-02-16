#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
zsh -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
zsh -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
sudo apt install fonts-powerline -y
    
rm ~/.zshrc
rm ~/.p10k.zsh

cp ~/.dotfiles/.zshrc ~/
cp ~/.dotfiles/.p10k.zsh ~/

sudo usermod --shell $(which zsh) gitpod

eval "$(cs setup --apps sbt-launcher,ammonite,cs,coursier,sbt,sbtn,bloop,scalafmt,scala,scalac --install-dir /workspace/coursier-apps)"
