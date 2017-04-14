<?php
$server = proc_open(PHP_BINARY . " src/pocketmine/PocketMine.php --no-wizard", [
//$server = proc_open("./start.sh --no-wizard", [
	0 => ["pipe", "r"],
	1 => ["pipe", "w"],
	2 => ["pipe", "w"]
], $pipes);
if(!is_resource($server)){
	die('Failed to create process');
}
fwrite($pipes[0], "plugins\nstop\n\n");
fclose($pipes[0]);
while(!feof($pipes[1])){
	echo fgets($pipes[1]);
}
fclose($pipes[1]);
fclose($pipes[2]);
echo "\n\nReturn value: ". proc_close($server) ."\n";
if(count(glob("crashdumps/CrashDump*.log")) === 0){
	$phar = new Phar("Functions.phar");
	$phar->buildFromDirectory("plugins/Functions");
	echo "The functions plugin is currently working well.\nTo download the plugin, go to:\nhttp://46.4.105.238:8080/job/Functions/lastSuccessfulBuild/artifact/Functions.phar\n\n";
	exit(0);
}else{
	echo "The functions plugin has a syntax error.\nIt will be fixed whenever the developers have a chance.\nPlease be patient and wait for them to fix it.\nAlternatively, you can get a previous stable version here:\nhttp://46.4.105.238:8080/job/Functions/lastStableBuild/\n\n";
	exit(1);
}
