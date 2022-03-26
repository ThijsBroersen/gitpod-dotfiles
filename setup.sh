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

sudo usermod --shell $(which zsh) gitpod

source .gitpodenv.sh

curl -s "https://get.sdkman.io" | bash
echo -e "source /workspace/sdkman/bin/sdkman-init.sh\n" >> ~/.bashrc
echo -e "source /workspace/sdkman/bin/sdkman-init.sh\n" >> ~/.zshrc

source /workspace/sdkman/bin/sdkman-init.sh

sdk install java 22.0.0.2.r17-grl

curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs
chmod +x cs
eval "$(./cs setup --yes)"
rm cs
cs install metals
cs install bloop --only-prebuilt=true

mkdir -p ~/.bloop
echo '{"javaOptions": ["-Xms1G","-Xmx8G","-Xss64m","-XX:ReservedCodeCacheSize=256M","-XX:MaxInlineLevel=20","-XX:+UseParallelGC","-Dfile.encoding=UTF-8"]}' > ~/.bloop/bloop.json
