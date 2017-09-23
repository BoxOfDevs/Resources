<?php
$server = proc_open('./bin/php7/bin/php PocketMine-MP.phar --no-wizard --disable-readline', [
    0 => ['pipe', 'r'],
    1 => ['pipe', 'w'],
    2 => ['pipe', 'w'],
], $pipes);
fwrite($pipes[0], "version\nmakeplugin THEPLUGINNAME\nstop\n\n");
while(!feof($pipes[1])){
    echo fgets($pipes[1]);
}
fclose($pipes[0]);
fclose($pipes[1]);
fclose($pipes[2]);
echo "\n\nReturn value: ".proc_close($server)."\n";
if(count(glob('plugins/DevTools/THEPLUGINNAME*.phar')) === 0){
    echo "Failed to create a THEPLUGINNAME phar!\n";
    exit(1);
}else{
    $fn = glob('plugins/DevTools/THEPLUGINNAME*');
    rename($fn[0], 'plugins/DevTools/THEPLUGINNAME.phar');
    echo "A THEPLUGINNAME phar was created!\n";
    exit(0);
}
