#!/bin/sh
#

echo ''
echo '************************************************************'
echo "**                       STARTED                          **"
echo '************************************************************'
echo "**              Uploaded by: Hamdy Ahmed                  **"
echo "************************************************************"
echo "**                 KeyAdder v8.7                          **"
echo "************************************************************"
echo "************************************************************"
sleep 3s

if [ -d /usr/lib/enigma2/python/Plugins/Extensions/KeyAdder ]; then
echo "> removing package please wait..."
sleep 2s 
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/KeyAdder > /dev/null 2>&1
fi

status='/var/lib/opkg/status'
package='enigma2-plugin-extensions-KeyAdder'

if grep -q $package $status; then
opkg remove $package > /dev/null 2>&1
fi

sleep 2s

echo "downloading SubsSupport..."
wget -O  /var/volatile/tmp/KeyAdder-8.7.tar.gz https://raw.githubusercontent.com/Ham-ahmed/20-5/refs/heads/main/KeyAdder-8.7.tar.gz
echo "Installing SubsSupport..."
tar -xzf /var/volatile/tmp/KeyAdder-8.7.tar.gz -C /
rm -rf /var/volatile/tmp/KeyAdder-8.7.tar.gz > /dev/null 2>&1

sleep 2s
sync
echo "#########################################################"
echo "#########################################################"
echo "Installing dependency files"
opkg install python3-codecs python3-compression python3-core python3-difflib python3-json python3-requests python3-xmlrpc unrar python3-beautifulsoup4


# ============================================================================================================
sleep 2
sync
echo "==================================================================="
echo "===                          FINISHED                           ==="
echo "===               Modded by Hamdy Ahmed                         ==="
echo "==================================================================="
sleep 2
echo "==================================================================="
echo "===                        Restarting                           ==="
echo "==================================================================="

killall -9 enigma2
exit 0
