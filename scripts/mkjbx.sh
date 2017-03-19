#!/bin/bash

#Description: Script to ready the machine as a Jukebox
#Author: Jarrod Krige
#Date: 2017/02/24

#EXAMPLE ./mkjbx.sh

clear
echo "Setting this machine up as a Jukebox..."
echo
echo "~ script called with ------->  ${@}     "
echo "~ ISAUDIO ------------------>  $1       "
echo "~ \$2 ---------------------->  $2       "
echo "~ path to this script ------>  ${0}     "
echo "~ parent path -------------->  ${0%/*}  "
echo "~ this script -------------->  ${0##*/} "
echo
echo
if [[ISAUDIO]] todo
echo
echo
echo "WARNING: This will make significant changes to the system."
echo
read -p "Proceed with Jukebox setup? (Y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

  #Arguments to variables
  ISAUDIO=$1
  HOSTNAME=$2

  #Change this file's owner to root:
  echo "Change this file's owner to root:"
  sudo chown root:root ${0}
  echo

  #Update the Pi
  echo "Update the Pi:"
  sudo apt-get-update
  echo

  #Add system user 'juke'
  echo "Add system user 'juke':"
  sudo adduser --quiet --disabled-password --shell /bin/bash --home /home/juke --gecos "User" juke
  sudo bash -c 'echo "juke:jukebox10110" | chpasswd'
  echo

  #Give sudo permission to system user 'juke'
  echo "Give sudo permission to system user 'juke':"
  sudo -u juke bash -c 'echo "juke ALL=(ALL:ALL) ALL" | (EDITOR="tee -a" visudo)'
  echo

  #Allow this script to be executed by 'juke' with no sudo password required
  echo "Allow this script to be executed by 'juke' with no sudo password required:"
  sudo -u juke bash -c 'echo "juke ALL=(ALL) NOPASSWD: ${0}" | (EDITOR="tee -a" visudo)'
  echo

  #Add admin user 'jarrod' -TODO: Rather use this: http://unixetc.co.uk/2016/01/07/how-to-rename-the-default-raspberry-pi-user/
  echo "Add admin user 'jarrod':"
  sudo -u juke adduser --quiet --disabled-password --shell /bin/bash --home /home/jarrod --gecos "User" jarrod
  sudo -u juke bash -c 'echo "jarrod:jukebox10110" | chpasswd'
  echo

  #Give sudo permission to admin user 'jarrod'
  echo "Give sudo permission to admin user 'jarrod':"
  sudo -u juke bash -c 'echo "jarrod ALL=(ALL:ALL) ALL" | (EDITOR="tee -a" visudo)'
  echo

  #Change hostname
  echo "Change hostname:"
  CURRENTHOSTNAME=$(cat /etc/hostname)
  sudo -u juke sed -i "s/$CURRENTHOSTNAME/$HOSTNAME/g" /etc/hosts
  sudo -u juke sed -i "s/$CURRENTHOSTNAME/$HOSTNAME/g" /etc/hostname
  echo

  #Reboot
  echo
  echo
  read -s -n 1 -p "Press any key to reboot..."
  echo
  sudo -u juke reboot

  #TODO:
  #Remove user pi
  #Edit pi config for default user and to stop UI mode
  #Set time
  #Set static IP
  #Setup Pi-DigiAMP+ for Audio Pi
  #Setup Unicorn Hat for Visusal Pi
  #Install/update dependencies including python, c compiler

fi

exit
