#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
zsh -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
zsh -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
sudo apt install fonts-powerline cloc -y
    
rm ~/.zshrc || true
rm ~/.p10k.zsh || true

cp ~/.dotfiles/.zshrc ~/
cp ~/.dotfiles/.p10k.zsh ~/
cp ~/.dotfiles/.gitpodenv.sh ~/

sudo usermod --shell $(which zsh) gitpod

source .gitpodenv.sh

curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs
chmod +x cs
eval "$(./cs setup --yes --install-dir /workspace/coursier-apps --jvm zulu:17)"
rm cs
cs install bloop:1.4.12 --only-prebuilt=true --install-dir /workspace/coursier-apps
