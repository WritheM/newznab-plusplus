<?php
require('config.php');
require_once(WWW_DIR.'/lib/teevee.php');

$t = new TeeVee(true);
if(isset($argv[1]))
    $t->loadFromRemote($page = $argv[1]);
$t->processReleases(5);
?>
