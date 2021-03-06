#!/bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
zsh -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
zsh -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
sudo apt install fonts-powerline cloc -y
    
rm ~/.zshrc || true
rm ~/.p10k.zsh || true

cp ~/.dotfiles/.zshrc ~/
cp ~/.dotfiles/.p10k.zsh ~/
cp ~/.dotfiles/.gitpodenv.sh ~/
echo -e "source ~/.gitpodenv.sh\n" >> ~/.bashrc
echo -e "source ~/.gitpodenv.sh\n" >> ~/.zshrc

sudo usermod --shell $(which zsh) gitpod

source .gitpodenv.sh

echo -e "source /home/gitpod/.sdkman/bin/sdkman-init.sh\n" >> ~/.bashrc
echo -e "source /home/gitpod/.sdkman/bin/sdkman-init.sh\n" >> ~/.zshrc

source /workspace/sdkman/bin/sdkman-init.sh
