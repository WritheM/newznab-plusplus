<?php
// Required fields.
$themevars['theme_title'] = "WritheM nn++";
$themevars['theme_link'] = "https://github.com/WritheM/newznab-plusplus/issues";
$themevars['theme_author'] = "pironic@writhem";
$themevars['theme_version'] = "0.1-alpha";

// Realtime status can be defined by adding a full path to your log files.2c45c2a8284e9c13f32689c44d0ee13e
// Each log file added will show as another 'dot'.
$themevars['update_logs'] = array(
    array('/mnt/adamo/nzbfiles/prologs/backfill.log','Backlog Updater'),
    array('/mnt/adamo/nzbfiles/prologs/part1.log','Headers Downloader'),
    array('/mnt/adamo/nzbfiles/prologs/part2.log','Release Creator'),
    array('/mnt/adamo/nzbfiles/prologs/part3.log','External Info Parser'),
    array('/mnt/adamo/nzbfiles/prologs/part4.log','Media Info Updater')
);

// Custom footer links to show below the 'Powered by' 
$themevars['footer_links'] = array(
    array('Terms and Conditions',WWW_TOP . '/terms-and-conditions'),
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

// Allows you to rename the Cart to something else, like Bookmarks.
$themevars['cart_name_add'] = "Add to Cart"; // used when you want to add an item to 'Add to Cart'
$themevars['cart_name_plural'] = "Cart"; // used when referring to the items in your 'Cart'
$themevars['cart_icon'] = 'icon-shopping-cart'; // a font-awesome or bootstrap icon used on buttons (need fa- to indicate fontawesome icons)