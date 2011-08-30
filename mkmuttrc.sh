#!/bin/bash

MUTTRC=~/.muttrc

echo "Will configure mutt"
echo -n "Your gmail username without @gmail.com: "
read username

echo -n "Your firstname: "
read firstname

echo -n "Your lastname: "
read lastname

echo -n "You password (leave it blank to let mutt asking your password on startup): "
read password

#create muttrc
cp mutt_template $MUTTRC

#change config
sed -i "s/FIRSTNAME/$firstname/g" $MUTTRC
sed -i "s/LASTNAME/$lastnam/g"  $MUTTRC
sed -i "s/USERNAME/$username/g"  $MUTTRC
[[ ! -z $password ]] && sed -i "s/PASSWORD/$pasword/g"  $MUTTRC

echo "done"


