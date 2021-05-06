echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf
cat /etc/dnf/dnf.conf

sudo dnf upgrade --refresh
sudo dnf groupupdate core
sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y rpmfusion-nonfree-release-tainted 
sudo dnf install -y dnf-plugins-core
sudo dnf install -y *-firmware 
sudo dnf -y groupupdate sound-and-video

sudo dnf install -y fedora-workstation-repositories
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y gnome-tweak-tool

sudo dnf install -y util-linux-user
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

sudo rpm --import https://packages.microsoft.com/keys/microsoftfish.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install -y code

sudo dnf install -y graphviz
sudo dnf install -y gimp
sudo dnf install -y vlc
sudo dnf install -y qbittorrent 
sudo dnf install -y fira-code-fonts 'mozilla-fira*' 'google-roboto*'

sudo dnf install -y fish
chsh -s $(which fish)
sudo dnf install -y curl
curl -L https://get.oh-my.fish | fish

sudo dnf install -y tlp tlp-rdw
sudo systemctl enable tlp

sudo dnf copr enable kwizart/fedy
sudo dnf install fedy -y

# slack is manual download from slack site or via fedy
# zoom is manual download or via fedy

