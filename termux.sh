#!//data/com.termux/files/usr/bin/bash
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

sed_handle_alias_zshrc "color" "'~/.oh-my-zsh/custom/misc/.termux/colors.sh'"
sed_handle_alias_zshrc "style" "'p10k configure'"
sed_handle_alias_zshrc "update" "'~/.oh-my-zsh/custom/misc/upgrade.zsh'"
sed_handle_alias_zshrc "uninstall" "'~/.oh-my-zsh/custom/misc/uninstall.sh'"

git_handle_plugin_repo https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
sed_handle_plugin_zshrc "zsh-syntax-highlighting"

git_handle_plugin_repo https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
sed_handle_plugin_zshrc "zsh-autosuggestions"

git_handle_plugin_repo https://github.com/TamCore/autoupdate-oh-my-zsh-plugins "$HOME/.oh-my-zsh/custom/plugins/autoupdate"
sed_handle_plugin_zshrc "autoupdate"

git_handle_plugin_repo https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
sed -i 's~\(ZSH_THEME="\)[^"]*\(".*\)~\1powerlevel10k/powerlevel10k\2~' ~/.zshrc

sleep 3

if [ ! -f ~/.p10k.zsh ]; then
sed -i "/.p10k.zsh/d" ~/.zshrc


if ! grep -q "zsh" "$SHELL"; then
exec zsh -l
fi

exit

figlet "And lastly it is complete"
