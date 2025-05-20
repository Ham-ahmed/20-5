#!/bin/sh

#check python version
python=$(python -c "import platform; print(platform.python_version())")
sleep 1;
case $python in 
3.12.*|3.13.*)
echo ""
;;
*)
echo "> your image python version: $python is not supported"
sleep 3
exit 1
;;
esac

# Remove unnecessary files and folders
[ -d "/CONTROL" ] && rm -r /CONTROL >/dev/null 2>&1
rm -rf /control /postinst /preinst /prerm /postrm /tmp/*.ipk /tmp/*.tar.gz >/dev/null 2>&1

#config
plugin=ipaudiopro
version=haitham
url=https://gitlab.com/hmeng80/addons/-/raw/main/ipaudiopro-Haitham.tar.gz
package=/var/volatile/tmp/$plugin-$version.tar.gz

#download & install
echo "> Downloading $plugin-$version package  please wait ..."
sleep 3s

wget --show-progress -qO $package --no-check-certificate $url
download=$?
if [ $download -eq 0 ]; then
rm -rf /etc/enigma2/ipaudio.json >/dev/null 2>&1
fi
tar -xzf $package -C /
extract=$?
rm -rf $package >/dev/null 2>&1

echo ''
if [ $extract -eq 0 ]; then
echo "> $plugin-$version package installed successfully"
echo "> Uploaded By Haitham "
sleep 3s

else

echo "> $plugin-$version package installation failed"
sleep 3s
fi
