#!/bin/bash

# Google Cloud CLI keys
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" "--unattended"
sudo chsh -s $(which zsh) $(whoami)

# Zsh theme
cp $HOME/.dotfiles/elizabeth.zsh-theme $HOME/.oh-my-zsh/custom/themes/elizabeth.zsh-theme
## curl -fsSLo $HOME/.oh-my-zsh/custom/themes/elizabeth.zsh-theme https://raw.github.com/elizabeth-dev/dotfiles/main/elizabeth.zsh-theme

# Zsh autosuggestions
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-autosuggestions/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-autosuggestions.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-autosuggestions.gpg > /dev/null

# Zshrc
cp $HOME/.dotfiles/.zshrc ~/.zshrc

# Install packages
sudo apt-get update && sudo apt-get install zsh-syntax-highlighting zsh-autosuggestions
