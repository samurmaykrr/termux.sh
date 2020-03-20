#!//data/com.termux/files/usr/bin/bash
current_dir=$(pwd)
touch ~/.hushlogin
apt update && apt upgrade -y
clear
echo 'Welcome and enjoy the script as it runs'
echo
apt install figlet -y
clear
figlet TERMUX redefined
echo 'By T O W H A'
sleep 5
echo -e "Requesting access to storage"
termux-setup-storage
echo
echo
clear 
apt install nmap -y
apt install nano -y
apt install python -y
apt install wget -y
apt install nodejs -y
apt install curl -y
apt install ruby -y
apt install openssh -y
apt install proot -y
apt install git -y
apt install tsu -y
apt install tmux -y
apt install tree -y
apt install htop -y
apt install vim -y
echo
clear
git clone https://github.com/Towha/termux-sudo 
cd termux-sudo
pkg install ncurses-utils
cat sudo > /data/data/com.termux/files/usr/bin/sudo
chmod 700 /data/data/com.termux/files/usr/bin/sudo
cd
echo
clear
#!//data/com.termux/files/usr/bin/bash
echo
apt update
clear
sleep 2
echo 'Creating extra buttons'
mkdir -p ~/.termux && echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP','DEL'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP']]" > ~/.termux/termux.properties
termux-reload-settings
#echo "Please exit and restart termux for better performance"
sleep 3
clear
rm -rf termux-sudo termux.sh
clear
figlet "Now shall we customize our shell  ͡°ᴥ ͡° ..."
pkg i -y zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended" > /dev/null
chsh -s zsh
echo -e "${INFO} Making Oh My Zsh nicer..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
    [[ -z $(grep "autoload -U compinit && compinit" $HOME/.zshrc) ]] && echo "autoload -U compinit && compinit" >> $HOME/.zshrc
    sed -i '/^ZSH_THEME=/c\ZSH_THEME="powerlevel10k/powerlevel10k"' $HOME/.zshrc
    if [ $(uname -o) != Android ]; then
        sed -i '/^plugins=/c\plugins=(git sudo z command-not-found zsh-syntax-highlighting zsh-autosuggestions zsh-completions)' $HOME/.zshrc
    else
        sed -i '/^plugins=/c\plugins=(git z zsh-syntax-highlighting zsh-autosuggestions zsh-completions)' $HOME/.zshrc
    fi
    [ $(uname -o) != Android ] && chsh -s $(which zsh) || chsh -s zsh
    [ $? == 0 ] && echo -e "${INFO} Oh My Zsh is nicer now！"
    zsh


sleep 3


figlet "And lastly it is complete"
