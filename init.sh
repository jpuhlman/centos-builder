#!/bin/bash

if [ -n "$EXTRA_PACKAGES" ] ; then
   yum install -y $EXTRA_PACKAGES
fi

sed -e "/$USERID::/d" -i /etc/passwrd
groupadd -g $USERGID engr 
useradd -d $HOME -M -u $USERID -g $USERGID $USERNAME
echo "$USERNAME  ALL=(ALL)       NOPASSWD: ALL" | tee -a /etc/sudoers > /dev/null
sudo usermod -a -G mock $USERNAME
echo "export MOCK_OPTS='--old-chroot'" >> /etc/bashrc
echo
echo "Welcome to $RELEASE_DISTRO $RELEASE_VERSION builder"
echo
if [ -n "$SCRIPTRUNNER" ] ; then
   if [ -d "$CURRENTPATH" ] ; then
      cd $CURRENTPATH
   else
      cd $HOME
   fi
   chmod 755 $SCRIPTRUNNER
   sudo --preserve-env="CURRENTPATH" -u $USERNAME $SCRIPTRUNNER
else 
   su - $USERNAME
fi
