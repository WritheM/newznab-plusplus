<?php
// Required fields.
$themevars['theme_title'] = "WritheM nn++";
$themevars['theme_link'] = "https://github.com/WritheM/newznab-plusplus/issues";
$themevars['theme_author'] = "pironic@writhem";
$themevars['theme_version'] = "0.1-alpha";

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

// if a user is connecting on non-ssl, this will show the dialog that reminds them to switch.
// obviously, only enable this is you offer ssl connections ;-)
$themevars['warn_not_ssl'] = true;

// If you are hosting mulitple instances and want to warn a user that they are browsing a beta server,
// include the hostname of the server in the array below. An empty array will always assume that
// you are on a production environment.
$themevars['beta_hostname'] = array(
    'nasbox'
);