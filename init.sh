#!/bin/bash

if [ -n "$EXTRA_PACKAGES" ] ; then
   yum install -y $EXTRA_PACKAGES
fi

groupadd -g $USERGID engr 
if [ -n "$(cat /etc/passwd | grep "::$USERGID" )" ] ; then
	USERNAME=$(cat /etc/passwd | grep "::$USERGID" | cut -d : -f 1)
        usermod -d $HOME -u $USERID -g $USERGID $USERNAME
else
        useradd -d $HOME -M -u $USERID -g $USERGID $USERNAME
fi
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
