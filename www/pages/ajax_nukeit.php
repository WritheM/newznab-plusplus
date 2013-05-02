<?php
require_once(WWW_DIR."/lib/framework/db.php");
require_once(WWW_DIR."/lib/predb.php");

if (!$users->isLoggedIn())
	$page->show403();
    
$db = new DB();
$predb = new PreDB();

$userdata = $users->getById($_SESSION['uid']);

if ($userdata['role'] == 2 && isset($_GET['action']) && $_GET['action'] == "1" && isset($_GET['dirname']) && isset($_GET['category'])) {    
	print "Aquiring Target...";
    $preArray['ctime'] = time();
    $preArray['dirname'] = $_GET['dirname'];
    $preArray['category'] = $_GET['category'];
    
	$ret = $predb->updatePreDB($db, $preArray);
    sleep(1);
	if (!$ret)
		print "Error when entering coordinates. pre not made.";
	else
		print "Target Located, Coordinates entered, attempting to arm the nuke...";
} elseif ($userdata['role'] == 2 && isset($_GET['action']) && $_GET['action'] == "2" && isset($_GET['dirname']) && isset($_GET['nuketype']) && isset($_GET['nukereason'])) {
    $preArray['ctime'] = time();
    $preArray['dirname'] = $_GET['dirname'];
    $preArray['category'] = $_GET['nuketype'];
    $preArray['nuke_filename'] = $_GET['nukereason'];
    
	$ret = $predb->updatePreDB($db, $preArray, true);
    sleep(2);
	if (!$ret)
		print "Coordinates not found. Not arming the warhead.";
	else
		print "The Warhead has been armed and is ready for deployment...";
} elseif ($userdata['role'] == 2 && isset($_GET['action']) && $_GET['action'] == "3" && isset($_GET['dirname']) && isset($_GET['guid'])) {
        $db->query(sprintf("UPDATE releases SET preID = (SELECT id FROM `predb` where dirname = %s) WHERE guid = %s;",
            $db->escapeString($_GET['dirname']),				
            $db->escapeString($_GET['guid'])
        ));

    sleep(2);
		print "Nuke has been launched. :) Have a nice day.";
} else {
	print "problem with the continum transfunctioner... ";
}
