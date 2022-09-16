echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf
cat /etc/dnf/dnf.conf

sudo dnf upgrade --refresh
sudo dnf check
sudo dnf autoremove
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update
sudo reboot now
sudo dnf groupupdate core

sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf install -y dnf-plugins-core
sudo dnf install -y *-firmware
sudo dnf -y groupupdate sound-and-video

# enable the other repos
sudo dnf install -y fedora-workstation-repositories
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install chrome
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

# install some of the core things from repos
sudo dnf install -y git
sudo dnf install -y graphviz
sudo dnf install -y gimp
sudo dnf install -y fira-code-fonts 'mozilla-fira*' 'google-roboto*'

# set up fish shell and enable vim keybinds
sudo dnf install -y fish util-linux-user
sudo dnf install -y curl
chsh -s $(which fish)
curl -L https://get.oh-my.fish | fish
mkdir -p /home/$USER/.local/bin
set -Ua fish_user_paths /home/$USER/.local/bin
set -Ua fish_vi_key_bindings

# power profiles - remove legacy and install new
sudo dnf remove power-profiles-daemon
sudo dnf install -y tlp tlp-rdw
sudo systemctl enable tlp

# configure the user interface and swap escape to cap lock
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
gsettings set org.gnome.desktop.interface text-scaling-factor 1.5

# install all the random apps that I just need
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub com.visualstudio.code
sudo flatpak install -y flathub md.obsidian.Obsidian
sudo flatpak install -y flathub us.zoom.Zoom
sudo flatpak install -y flathub com.slack.Slack
sudo flatpak install -y flathub org.videolan.VLC
sudo flatpak install -y flathub org.qbittorrent.qBittorrent

# install nvim and get it configured
sudo dnf copr enable agriffis/neovim-nightly
sudo dnf install -y neovim python3-neovim

# c++ prerequisites for nvim
sudo dnf install -y gcc-c++

# pip prerequisites for nvim
sudo dnf install -y python3-pip
sudo pip3 install pynvim

# install the npm which will be required for
# vim language servers
sudo dnf install -y npm
sudo npm install -g bash-language-server pyright vscode-langservers-extracted

mkdir /home/$USER/git
cd /home/$USER/git
git clone https://github.com/brainfucksec/neovim-lua.git
cd neovim-lua/
cp -Rv nvim ~/.config/
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim +PackerSync
