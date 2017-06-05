cd /home/travis/build/

echo "Cloning PocketMine..."
git clone --recursive --branch=master https://github.com/pmmp/PocketMine-MP.git
cd PocketMine-MP

echo "Downloading a php binary..."
curl -o pmbin.tar.gz 'https://jenkins.pmmp.io/job/PHP-PocketMine-Linux-x86_64/lastBuild/artifact/PHP_Linux-x86_64.tar.gz'
echo "Unpacking binary..."
tar -xzf pmbin.tar.gz

mkdir -p plugins
cd plugins
echo "Downloading DevTools from Poggit..."
curl -O https://poggit.pmmp.io/r/4337/PocketMine-DevTools.phar

echo "Moving the plugin to plugins folder..."
cp -rf /home/travis/build/BoxOfDevs/THEPLUGINNAME .
cd ..

echo "Downloading php script..."
curl -o Travis.php 'https://cloud.himbeer.me/bod/travisgen.php?slug='$TRAVIS_REPO_SLUG'&type=php'

echo "Executing php script..."
php Travis.php
