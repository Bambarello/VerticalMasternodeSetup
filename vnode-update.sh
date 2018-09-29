#!/bin/bash
# Vertical Update Script
# (c) 2018 by Dwigt007 for Vertical Coin 
#
# Usage:
# bash vnode-update.sh 
#

#Color codes
RED='\033[0;91m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color



#Delay script execution for N seconds
function delay { echo -e "${GREEN}Sleep for $1 seconds...${NC}"; sleep "$1"; }

echo -e "${YELLOW}Vertical Update Script v0.1${NC}"

#KILL THE MFER
    verticalcoin-cli stop
    pkill verticalcoin
    delay 20

#Delete .verticalcoin contents 
echo -e "${YELLOW}Scrapping .verticalcoin...${NC}"
cd 
cd ~/.verticalcoin
rm -rf c* b* w* p* n* m* f* d* g*

#Delete OLD Binary
echo -e "${YELLOW}Deleting v1.3...${NC}"
cd ~
rm -rf ~/VerticalMasternodeSetup/verticalcoin
rm -rf ~/usr/bin/verticalcoind
rm -rf ~/usr/bin/verticalcoin-cli
rm -rf ~/usr/bin/verticalcoin-qt

#Install new Binaries
echo -e "${YELLOW}Installing v1.4...${NC}"
cd ~/VerticalMasternodeSetup
mkdir ~/VerticalMasternodeSetup/verticalcoin
wget https://github.com/verticalcoin/verticalcoin/releases/download/1.4/linux-x64.tar.gz
tar xzf linux-x64.tar.gz -C ~/VerticalMasternodeSetup/verticalcoin
rm -r linux-x64.tar.gz

sudo cp ~/VerticalMasternodeSetup/verticalcoin/verticalcoin* /usr/bin/
sudo chmod 755 -R ~/VerticalMasternodeSetup
sudo chmod 755 /usr/bin/verticalcoin*

#Restarting Daemon
    verticalcoind -daemon
echo -ne '[##                 ] (15%)\r'
sleep 6
echo -ne '[######             ] (30%)\r'
sleep 6
echo -ne '[########           ] (45%)\r'
sleep 6
echo -ne '[##############     ] (72%)\r'
sleep 10
echo -ne '[###################] (100%)\r'
echo -ne '\n'

echo -e "${GREEN}Your Vnode is now up to date${NC}"
echo '==========================================================================='
echo 'Masternode Information:' && verticalcoin-cli getinfo
echo '==========================================================================='
echo 'Masternode Status:' && verticalcoin-cli vnode status
echo '==========================================================================='
# EOF
