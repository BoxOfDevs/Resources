#!/bin/bash
clear

# shopt -s extglob
echo "system> Welcome to the Tesseract and DevTools installer!"
echo "system> This installer will automatically install Tesseract and DevTools for your server!"
echo "system> Ensure you are running Linux 64-bit, or the installer will not install properly."
z="PHP_7.0.3_x86-64_Linux.tar.gz"
l="install_log/log"
le="install_log/log_errors"
lp="install_log/log_php"
lpe="install_log/log_php_errors"
w="install_log/log_wget"
wp="install_log/log_wget_php"

	mkdir install_log
	echo "system> Installing Tesseract..."
	wget --no-check-certificate https://github.com/TesseractTeam/Tesseract/archive/master.zip >>./$w 2>>./$w
  chmod 777 master.zip >>./$l 2>>./$le
	unzip -o master.zip >>./$l 2>>./$le
	chmod 777 Tesseract-master >>./$l 2>>./$le
	cd Tesseract-master >>./$l 2>>./$le
	chmod 777 src >>../$l 2>>../$le
	cp -rf src .. >>../$l 2>>../$le
	cd .. >>../$l 2>>../$le
	rm -rf Tesseract-master >>./$l 2>>./$le
	rm -rf master.zip >>./$l 2>>./$le
        wget --no-check-certificate https://raw.githubusercontent.com/TesseractTeam/Tesseract/master/start.sh >>./$l 2>>./$le
        wget --no-check-certificate https://raw.githubusercontent.com/TesseractTeam/Tesseract/master/LICENSE.md >>./$l 2>>./$le
        chmod 755 start.sh >>./$l 2>>./$le
	echo
	echo "system> Installing PHP binary..."
	wget --no-check-certificate https://dl.bintray.com/pocketmine/PocketMine/$z >>./$wp 2>>./$wp
	chmod 777 PHP* >>./$lp 2>>./$lpe
	tar zxvf PHP* >>./$lp 2>>./$lpe
	rm -r PHP* >>./$lp 2>>./$lpe
	wget --no-check-certificate https://raw.githubusercontent.com/BoxOfDevs/Resources/master/jenkins/SCRIPT.php >>./$w 2>>./$w
	chmod 777 SCRIPT.php >>./$l 2>>./$le
	mkdir plugins >>./$l 2>>./$le
  cd plugins
  echo "system> Installing PLUGIN"
  git clone https://github.com/BoxOfDevs/REPO.git
  cd ../
  echo "system> Tesseract & PLUGIN installation completed! Installing DevTools..."
        wget --no-check-certificate -O plugins/DevTools.phar https://github.com/TesseractTeam/Tesseract/releases/download/DevTools_v1.2/DevTools_v1.2.phar >>./$w 2>>./$w
        echo "system> Installation successfully completed!"
        php SCRIPT.PHP
