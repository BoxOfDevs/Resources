cd /home/travis/build/

echo "Getting PocketMine .phar and DevTools..."
wget 'https://jenkins.pmmp.io/job/PocketMine-MP/lastSuccessfulBuild/artifact/*zip*/archive.zip'
echo "Unpacking PocketMine .phar and DevTools..."
unzip archive.zip
cd archive
echo "Renaming the PocketMine .phar to PocketMine-MP.phar"
rename "s/PocketMine-MP_.*\.phar/PocketMine-MP\.phar/" *.phar

echo "Downloading a php binary..."
curl -o pmbin.tar.gz 'https://jenkins.pmmp.io/job/PHP-7.2-Linux-x86_64/lastSuccessfulBuild/artifact/PHP_Linux-x86_64.tar.gz'
echo "Unpacking binary..."
tar -xzf pmbin.tar.gz

mkdir -p plugins
cd plugins
echo "Moving DevTools into correct folder..."
mv ../DevTools.phar .

echo "Moving the plugin to plugins folder..."
cp -rf /home/travis/build/BoxOfDevs/THEPLUGINNAME .
cd ..

echo "Downloading php script..."
curl -o Travis.php 'https://cloud.himbeer.me/bod/travisgen.php?slug='$TRAVIS_REPO_SLUG'&type=php'

echo "Executing php script..."
./bin/php7/bin/php Travis.php
