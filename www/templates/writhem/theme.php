<?php
// list of files that are being changed
// pages/filelist.php

// Realtime status can be defined by adding a full path to your log files.
// Each log file added will show as another 'dot'.
$themevars['update_logs'] = array(
    array('/mnt/adamo/nzbfiles/prologs/part4.log','Backlog Updater'),
    array('/mnt/adamo/nzbfiles/prologs/part1.log','Binary Updater'),
    array('/mnt/adamo/nzbfiles/prologs/part2.log','Release Updater'),
    array('/mnt/adamo/nzbfiles/prologs/part3.log','MediaInfo Updater')
);

// Custom footer links to show below the 'Powered by' 
$themevars['footer_links'] = array(
    array('Terms and Conditions',WWW_TOP . '/terms-and-conditions'),
    array('Privacy Policy',WWW_TOP . '/content/5/')
);