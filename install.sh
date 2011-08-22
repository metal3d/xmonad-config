#!/bin/bash
#unstable for now

[[ $UID == "0" ]] && echo "Please, use installer as normal user" && exit 1 

#fedora, centos
test -f /etc/fedora-release && OS=redhat
test -f /etc/redhat-release && OS=redhat

#ubuntu, debian like...
test -f /etc/debian-release && OS=debian
test -f /etc/debian_release && OS=debian

if [ $OS = 'redhat'  ]; then
    su -c "yum install xmonad dmenu feh uzbl-browser xscreensaver" 

elif [ $OS = 'debian' ]; then
    sudo aptitude install xmonad dmenu feh uzbl xscreensaver

else
    cat <<HELP
Sorry, your linux distribution isn't yet managed by this installer. If you know how to install packages, please contact author: metal3d@gmail.com
HELP
    exit 1
fi


#get source
cd /tmp
git clone git://github.com/metal3d/xmonad-config.git
cd xmonad-config

#install files
mkdir -p ~/.xmonad
cp xmoand/xmonad.hs ~/.xmonad
xmonad --recompile || exit 1

cp xmobarrc ~/.xmobarrc

mkdir -p ~/bin
cp bin/* ~/bin/
chmod -R ug+x ~/bin/xmonad-startup

