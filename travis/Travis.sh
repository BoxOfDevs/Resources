git clone --recursive --branch=master https://github.com/pmmp/PocketMine-MP.git
mkdir -p PocketMine-MP/plugins
curl -O https://poggit.pmmp.io/r/3530/PocketMine-DevTools.phar
cp -f  PocketMine-DevTools.phar PocketMine-MP/plugins/
cp -rf BoxOfDevs/THEPLUGINNAME PocketMine-MP/plugins
cd PocketMine-MP/plugins/
cd /home/travis/build/PocketMine-MP
curl -o Travis.php 'https://cloud.himbeer.me/bod/travisgen.php?slug=$TRAVIS_REPO_SLUG&type=php'
