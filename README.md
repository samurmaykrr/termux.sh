[Termux](https://i.imgur.com/8IuYLRl.jpg)
Download termux from [playstore](https://play.google.com/store/apps/details?id=com.termux) or [fdroid](https://f-droid.org/packages/com.termux/)

- The termux app itself is same but the signature is different so you can't use the Play store version with termux styling from F-Droid.but if you download both termux and termux styling from F-Droid you can use both.Termux from F-Droid has free styling so I suggest to use it from F-Droid.


##The homescreen of termux
![Image of Termux homescreen](https://i.imgur.com/125iBJY.jpg)

#Basic operation
 As the saying goes, "Before you can run, you have to learn to walk", understand the basic operations first, and then do some sloppy operations easily.

# Options and menus
A long press on the screen will display a selectable copy cursor, along with the Copy, Paste, More ... options.

[Options screen](https://i.imgur.com/DNvRPLY.jpg)

-Click More ... to go to the next menu level.

[More options](https://i.imgur.com/cpCYVBd.jpg)

```
Long press on screen
 ├── COPY: Copy
 ├── PASTE: Paste
 ├── More: More
    ├── Select URL: Select URL
    └── Share transcipt: transfer all output of the current session (via Android api)
    └── Reset: Reset
    └── Kill process: Kill the current terminal session process
    └── Style: Style (requires Termux: Styling plugin)
    └── Keep screen on:
    └── Help: Help documentation (Termux Wiki)
```
Swipe right from the left edge of the screen to drag out the navigation bar, where you can create, switch, rename sessions, and bring up input methods.

[Left multipanel](https://i.imgur.com/0zfWmce.png)

##Common shortcut keys
 When using the terminal, you need to use the Alt, Ctrl, Esc and other keys, but these keys are not available on the phone.

 In Ter­mux, you can use the volume down button to simulate the Ctrl key.  For example, volume + L is equivalent to pressing Ctrl + L on the keyboard.

 The following are some of the shortcuts commonly used in the terminal, and they also work in Ter­mux.
```
 Ctrl + A-> cursor to start position
 Ctrl + E-> cursor to the end
 Ctrl + K-> Cut everything from here to the end
 Ctrl + U-> Cut everything from here to the beginning
 Ctrl + W-> Cut here to the left
 Ctrl + Y-> Paste words cut by Ctrl + U, Ctrl + D, Ctrl + W
 Ctrl + L-> equivalent to clear command, clear screen
 Ctrl + C-> terminate process / command
 Ctrl + D-> close terminal
 Ctrl + Z-> Suspend (send SIGTSTP to) the current process
 The volume plus button can be used as a special key to generate a specific input, which can be roughly understood as the Fn key on a laptop.

 Volume + E-> Esc
 Volume + T-> Tab
 Volume + 1-> F1 (Volume increase + 2 is equivalent to F2, and so on)
 Volume +0-> F10
 Volume + B-> Alt + B, return a word when using readline
 Volume + F-> Alt + F, forward a word when using readline
 Volume + X-> Alt + X
 Volume + W-> Up Arrow
 Volume + A-> Left Arrow
 Volume + S-> Down Arrow
 Volume + D-> Right Arrow
 Volume + L-> | (pipe character)
 Volume + H-> ~ (tilde character)
 Volume + U-> _ (underscore character)
 Volume + P-> Page Up (previous page)
 Volume + N-> Page Down (next page)
 Volume +.-> Ctrl + \ (SIGQUIT)
 Volume + V-> Show volume control
 Volume + Q-> Show extra button view
 Volume + K-> Ibid
```
##Extended function buttons
 As mentioned earlier, Ter­mux can use the volume keys to implement shortcut keys. Personally, using volume keys is not very inconvenient.  Ter­mux also provides buttons for screen extensions.  You can use volume plus + Q or volume plus + K to show and hide.
[controls less](https://i.imgur.com/bN5Uazd.jpg)
In addition, the function keys can be moved to the left to call up the text input box, which can more conveniently paste and modify the instructions to be entered more finely.
[controls sampled up](https://i.imgur.com/0LYzWQR.jpg)

##Package management
In addition to supporting the apt command, Ter­mux also encapsulates the pkg command. The pkg command is backward compatible with the apt command. The official recommendation is to use the pkg command, because it will automatically update the apt list when installing or upgrading the package, which means that performing pkg upgrade is equivalent to performing apt update && apt upgrade, which simplifies the operation process.

##few simple default commands
```
pkg search >> search a package
 pkg install >> installation of a package, shorthand pkg i
 pkg uninstall >> uninstall a package
 pkg reinstall >> reinstall a package
 pkg update / pkg upgrade >> to upgrade package, shorthand pkg up
 pkg list-all >> lists all packages available for installation(update)
 pkg list-installed >> lists installed packages
 pkg files >> show the path to the relevant folder of a package
```
##Differences between Termux and the standard Linux directory structure
Unlike most Linux distributions, Ter­mux does not follow file system hierarchy standards, and you cannot find directories such as / bin, / etc, / usr, / tmp and so on in standard paths.  For convenience, Termux provides a special environment variable: PREFIX, which is equivalent to the / usr directory.
```
$ tree -d -L 1 $PREFIX
/data/data/com.termux/files/usr
├── bin
├── etc
├── include
├── lib
├── libexec
├── share
├── src
├── tmp
└── var
```
- In addition, the user home directory is also in an unconventional location.
```
$ echo $HOME
/data/data/com.termux/files/home
```
- Without root privileges, it is impossible to manipulate the root directory.
```
$ ls /
ls: cannot open directory '/': Permission denied
```
- You can install proot for this and use the termux-chroot command to simulate the root environment and the standard Linux directory structure.
```
$ pkg i -y proot
$ termux-chroot
$ ls /
bin  data  dev  etc  home  lib  proc  root  sbin  share  storage  system  tmp  usr  var  vendor
$ ls /usr
bin  etc  include  lib  libexec  share  src  tmp  var
```
**This can be useful for some programs that must use a standard path.**
##root authority
 After all, the proot mentioned above is a simulation method, which will have certain limitations.  If the phone is already rooted, although you can switch to root by using su in Ter rootmux, some Ter 但是 mux commands will not work properly. After all, this is not a standard Linux environment.  The solution is to install tsu for root privileges, tsu is an alternative to su in Ter­mux.

Install tsu:
```
 pkg i -y tsu
```
 Execute the command with root privileges:
```
 tsudo command
```
 Switch to root user:
```
 tsu
```
 Under the root user, enter the exit command or press Ctrl + D to return to the normal user.

##Access external storage
 Ter­mux can only access its own internal data by default. If you want to access other data in the phone, after entering the following command, the phone will pop up a window for requesting permissions and allow it.
```
termux-setup-storage
```
- This will create the $ HOME / storage directory, and subdirectories in this directory will be symbolically linked to some common directories in phone storage.
```
$ tree storage
storage
├── dcim -> /storage/emulated/0/DCIM
├── downloads -> /storage/emulated/0/Download
├── movies -> /storage/emulated/0/Movies
├── music -> /storage/emulated/0/Music
├── pictures -> /storage/emulated/0/Pictures
└── shared -> /storage/emulated/0
```
- You can also access the root directory of external storage through / sdcard.

##SSH connection
As a Linux terminal or server, SSH is required.  Whether you are SSHing to Ter­mux or using Ter­mux to connect to other hosts, you need to install openssh first.
```
pkg i -y openssh
```
- Termux uses SSH to connect to other hosts
 Basic operation, ssh command:
```
ssh User@Host -p Port
```
##SSH to Termux
After all, the mobile phone is too restrictive to operate, and it is very elegant to operate through a SSH connection on the computer.

- set password:
```
 passwd
```
 - View username:
```
 whoami
```
 Since Ter­mux is a single-user environment, this step is not necessary.  You can log in using any username.
View IP address:
```
 ifconfig
```
 Start the SSH server:
```
 sshd
```
 The SSH server program is not started by default, and it needs to be restarted every time the application is closed and opened.  I will explain how to start the SSH server later.
 Gathering the three elements of SSH, you can now enter ssh commands in a computer terminal or use other SSH clients to connect.  Note that Ter­mux's SSH port is 8022.
```
 ssh User @ Host -p 8022
```
 - After executing the ssh command, you can enter the password to connect, and then you can easily perform various operations on the computer.

#A simple showcase of neofetch on localhost
[neofetch](https://i.imgur.com/wueHxNv.png)

- Configure SSH key login
 If you need to expose Ter­mux's SSH port to the public network, it is recommended to configure key login for security.

- The operation is no different from a normal Linux distribution, it is a basic operation.  If you do n’t know how to configure, you can refer to the two tutorials: “Configuring SSH Keys for Password-Free Login Using ssh-keygen and ssh-copy-id” and “Configuring SSH Keys for Linux VPS for Password-Free Login Using Xshell”  Make-up lessons are not repeated here.

- Friendly Tip: The path of the sshd_config file is $ PREFIX / etc / ssh / sshd_config
 It is recommended to use the SSH key one-click configuration script, which can get the public key from GitHub or the link and configure it automatically.  As long as you have set up a public key on GitHub, you can log in directly using the SSH key connected to the GitHub repository after configuration.

 - SSH server (sshd) starts automatically
 If you do not want to enter Ter­mux every time ssh connects and enter the sshd command, you can set it to start automatically.  There are two cases of sshd self-starting, one is when the Ter­mux application is opened, and the other is when the phone is turned on.

 - Start the SSH server automatically when opening the application
 Just add the sshd command to the shell configuration file. For example, if I use zsh, add it to ~ / .zshrc.  If it's bash, add it to ~ / .bashrc.
```
echo "sshd" >> ~/.zshrc
```
##Start the SSH server after the phone is powered on
 First install the Termux: Boot plug-in. After installation, give the plug-in permission to boot, so that Ter­mux can start automatically after booting.

- Create ~ / .termux / boot / directory (the scripts placed in this directory will be executed after booting Termux).
```
mkdir -p ~/.termux/boot/
```
- Create a new script in this directory, named start-sshd, and add the sshd command to this file.
```
echo 'termux-wake-lock; sshd' > ~/.termux/boot/start-sshd
```
The `termux-wake-lock` command prevents the process of the Ter­mux application from freezing when the phone is sleeping.
 After the setting is completed, the phone will automatically start Ter­mux and start the SSH server.

##Install a Linux distribution
- After all, Ter­mux is not a complete Linux environment. If there is a deeper Linux environment requirement, you can install and run a Linux distribution in Ter­mux to simulate a complete Linux environment. You can even install a desktop environment.


Here we used [AnLinux](https://github.com/EXALAB/AnLinux-App)
Is an app that helps users install Linux distributions in Ter­mux.  It is a guide, its essence is to give you a line of installation instructions for you to execute according to the distribution of your choice.  It's very easy to follow the instructions in the app, so I won't go into details here.
[app ss](https://i.imgur.com/D2Gw0GP.png)

##Custom extended function buttons
The default function buttons are too simple and do not have the left and right arrow keys, which is not convenient to use. Fortunately you can `~/.termux/termux.properties` customize the key configuration file.

[uograded panel](https://i.imgur.com/m25fnZC.jpg)

- If you want to set it up like this, you can add the following to the configuration file:
```
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP','DEL'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP']]
```
##As a lazy person, I usually do it with one click:
```
mkdir -p ~/.termux && echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP','DEL'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP']]" > ~/.termux/termux.properties
```
- Finally, enter the following command to reload the configuration, or close the application and then open it again.
```
termux-reload-settings
```
#Replace domestic software source
By default, the software package download speed is very slow. You can speed up the software package download speed by replacing the domestic software source.

To prevent modification errors, first back up the source list file:
```
cp $PREFIX/etc/apt/sources.list $PREFIX/etc/apt/sources.list.bak
```
reduction:cp $PREFIX/etc/apt/sources.list.bak $PREFIX/etc/apt/sources.list
Use `sed` the command to modify a key:
```
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
```
You can also enter `apt edit-sources` manually edited source files. Replace the default official source with the mirror source of Tsinghua University https://mirrors.tuna.tsinghua.edu.cn/termux.

##Check modification:
```
$ cat $PREFIX/etc/apt/sources.list
-The main termux repository:
-deb https://dl.bintray.com/termux/termux-packages-24 stable main
deb https://mirrors.tuna.tsinghua.edu.cn/termux stable main
```
##Last update:
```
pkg up
```
If the card progresses, exit the process of Termux, reopen it, and run `dpkg --configure -a` to repair it.

##Install common tools
Install some basic common tools to facilitate subsequent tossing.
```
pkg i -y git curl wget tree vim nano tmux htop
```
##Install and configure Oh My Zsh
- **Oh My Zsh will not make you a 10x developer ... but you may feel like one.**

- The above sentence comes from [Oh My Zsh README](https://github.com/ohmyzsh/ohmyzsh/blob/master/README.md), which means "pretend to force is the first productivity". 
- I don't use Oh My Zsh to pretend to make the terminal fancy. As a pragmatist, I really like the automatic suggestion, completion, and code highlighting functions, which greatly improves the input efficiency of the terminal. So regardless of platform, Oh My Zsh will be installed.

##Install zsh
```
pkg i -y zsh
```
- Install Oh My Zsh
- Download and install using curl
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
- Download and install using wget
```
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
Oh My Zsh will prompt you to set zsh as the default sehll after installation. If not prompted, enter the following command to set it up:
```
chsh -s zsh
```
##Modify Oh My Zsh Theme
Oh My Zsh has a lot of [built-in themes](https://github.com/ohmyzsh/ohmyzsh/wiki/themes), just need to modify the configuration file to enable. You can also choose to install [external themes](https://github.com/ohmyzsh/ohmyzsh/wiki/External-themes), such as [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

- The theme I use is ys , it's simple and practical, not fancy. Use `sed` the command to modify a key:
```
sed -i '/^ZSH_THEME=/c\ZSH_THEME="ys"' ~/.zshrc
```
After modification, enter the following command to refresh the configuration and you can see the effect:
```
source ~/.zshrc
```
##Install the Oh My Zsh plugin
- Install zsh-syntax-highlighting (code highlighting)
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```
Install zsh-autosuggestions (auto suggestion)
```
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```
Install zsh-completions (autocompletion)
```
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
```
zsh-completions plug-ins need to autoload -U compinit && compinitadd to .zshrc. Enter the command to add it with one click:
```
[ -z "`grep "autoload -U compinit && compinit" ~/.zshrc`" ] && echo "autoload -U compinit && compinit" >> ~/.zshrc
```
The need to enable plug-ins written to the configuration file, use the sedcommand to a key operation.
```
sed -i '/^plugins=/c\plugins=(git z zsh-syntax-highlighting zsh-autosuggestions zsh-completions)' ~/.zshrc
```
If you have a plugin you want to add, write it in parentheses, and separate the plugin names with spaces.
Last applied configuration
```
source ~/.zshrc
```
##Modify terminal color
To modify the color you need to install [Termux: Styling](https://wiki.termux.com/wiki/Termux:Styling)plugin, installed after a long press the screen to enter the More...menu, choose Styleyou can set the color and font. This was mentioned in the previous article when we introduced menus and options.
[styling](https://i.imgur.com/x9VIB0z.png)
- Choosing your favorite color and font, the set will `~/.termux` generate matching files in the directory `colors.properties` and font files font.ttf, these two files can be backed up, after only need to import, you no longer need to install the plugin.
```
$ tree ~/.termux
/data/data/com.termux/files/home/.termux
├── colors.properties
├── font.ttf
├── shell -> /data/data/com.termux/files/usr/bin/zsh
└── termux.properties
```
##Modify the greeting of the startup page
[start screen](https://i.imgur.com/TIzjpN9.jpg)
- This information will be helpful when you first come into contact with Termux, but with a deeper understanding of Termux and the desire to control human instincts, you will definitely want to replace it. I find that most of my friends will use their IDs in large fonts. Way to present.

```
vi $PREFIX/etc/motd
```
And for someone like me who advocates minimalism, choose to keep it from showing.
```
touch ~/.hushlogin
```
##tail
The first impression Termux gave me was that it was hard to use. I didn't even have the left and right arrow keys, and I almost uninstalled. Because recent studies router, so they try to enter Termux `pkg install iperf3`to install iPerf3, I did not expect installed, and then hold the phone over the house measured WiFi throughput. This also made me interested in it, and then I started to understand it slowly. It was out of hand and prompted me to try to customize it.


#To be continued
