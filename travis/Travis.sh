cd /home/travis/build/
echo "Making a php binary..."
pecl install channel://pecl.php.net/pthreads-3.1.6
pecl install channel://pecl.php.net/weakref-0.3.3
pecl install channel://pecl.php.net/yaml-2.0.0
echo "Cloning PocketMine..."
git clone --recursive --branch=master https://github.com/pmmp/PocketMine-MP.git
mkdir -p PocketMine-MP/plugins
echo "Downloading DevTools fro Poggit..."
curl -O https://poggit.pmmp.io/r/3530/PocketMine-DevTools.phar
cp -f  PocketMine-DevTools.phar PocketMine-MP/plugins/
cp -rf BoxOfDevs/THEPLUGINNAME PocketMine-MP/plugins
cd PocketMine-MP/plugins/
cd /home/travis/build/PocketMine-MP
echo "Downloading php script..."
curl -o Travis.php 'https://cloud.himbeer.me/bod/travisgen.php?slug='$TRAVIS_REPO_SLUG'&type=php'
echo "Executing php script..."
php Travis.php
