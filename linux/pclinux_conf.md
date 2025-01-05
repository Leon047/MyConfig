# My PC-Ubuntu Configuration

## Base Software Installation
Install essential tools and utilities:
```bash
sudo apt install python3-pip git ssh mosh htop libreoffice gnome-tweaks \
ubuntu-restricted-extras p7zip-rar rar unrar unace arj cabextract \
translate-shell flameshot obs-studio peek cmus neofetch fzf net-tools
```

## Tmux Configuration
Install and configure Tmux:
```bash
sudo apt install tmux
```

Clone the Tmux configuration repository:
```bash
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp ~/Documents/MyConfig/conf_rc/.tmux.conf.local ~/
```

## Vim Configuration
Install Vim:
```bash
sudo apt install vim
```

Add your custom Vim configuration:
- Repository: [SexyVim](https://github.com/Leon047/SexyVim)

## Oh-My-Zsh
Install and configure Zsh with Oh-My-Zsh:
```bash
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Change the default shell to Zsh:
```bash
chsh -s $(which zsh)
```

Add custom aliases:
```bash
sudo cat ~/Documents/MyConfig/conf_rc/aliases >> ~/.zshrc
```

## Environment Setup

### Docker and Docker-Compose
Follow the official documentation:
- [Install Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [Install Docker-Compose](https://docs.docker.com/compose/install/)

## Applications
Install additional applications:

<pre>
sudo snap install gimp
sudo snap install telegram-desktop
sudo snap install zoom-client
sudo snap install postman
sudo snap install discord --classic
sudo snap install spotify

sudo apt install ubuntu-restricted-extras
sudo apt install gnome-tweaks
sudo apt install kazam
sudo apt install steam
</pre>

## GNOME Shell Extensions

### Dash to Dock
- [Dash to Dock Extension](https://extensions.gnome.org/extension/307/dash-to-dock/)

### Hide Top Bar
Install the `autohidetopbar` extension:
```bash
sudo apt install gnome-shell-extension-autohidetopbar
```

## Additional Configurations

### Enable Password Feedback
Edit sudoers to enable password feedback:
```bash
sudo visudo
```

Add the following line under `Defaults env_reset`:
```plaintext
Defaults pwfeedback
```

Save and exit using:
```plaintext
Ctrl+X, then Y
```

### Ru Mnemonic Keyboard
Install a Ru mnemonic keyboard:
```bash
sudo add-apt-repository ppa:keymanapp/keyman
```

```bash
sudo apt install keyman onboard-keyman
```