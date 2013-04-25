<?php
// Required fields.
$themevars['theme_title'] = "WritheM nn++";
$themevars['theme_link'] = "https://github.com/WritheM/newznab-plusplus/issues";
$themevars['theme_author'] = "pironic@writhem";
$themevars['theme_version'] = "0.2-alpha";

// Uncomment the next line to define a logo to use for your top left banner.
// $themevars['logo'] = "/templates/writhem/images/banner.jpg";

// Realtime status can be defined by adding a full path to your log files.
// Each log file added will show as another 'dot'.
$themevars['update_logs'] = array(
    array('/www/newznab/misc/update_scripts/logs/part4.log','Backlog Updater'),
    array('/www/newznab/misc/update_scripts/logs/part1.log','Binary Updater'),
    array('/www/newznab/misc/update_scripts/logs/part2.log','Release Updater'),
    array('/www/newznab/misc/update_scripts/logs/part3.log','MediaInfo Updater')
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
    'betahost'
);

// Allows you to rename the Cart to something else, like Bookmarks.
$themevars['cart_name_add'] = "Add to Cart"; // used when you want to add an item to 'Add to Cart'
$themevars['cart_name_plural'] = "Cart"; // used when referring to the items in your 'Cart'
$themevars['cart_icon'] = 'icon-shopping-cart';//'icon-bookmark'; // a font-awesome or bootstrap icon used on buttons (need fa- to indicate fontawesome icons)

// Search bar settings
$themevars['search_bar_width'] = 180; // in pixels
$themevars['search_bar_docked'] = false; // if true, it will show the search bar inside the header menu that docks to the top of the screen when scrolling.
$themevars['search_bar_advanced'] = true; // show the category sub selection in the top bar. 