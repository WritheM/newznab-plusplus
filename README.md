newznab-plusplus
================

Currently based on nn+ rev: 2876

This is a theme in development, with intended purpose of becoming the new default gold standard that all themes will eventually live up to.  
This theme only changes the front-end theme, which means if you have a custom admin section you can copy most of that over from your existing theme into the writhem nn++ theme. The one exception is the user-roles template... We've given you the ability to hide advertisements or show them based on role. 

Check the issues tab at top for a list of things to come, or request features to be developed into the theme.

Installation
------------

Copy the www folder over your current install, replacing files if prompted.

There are changes required to the db located in `dbchanges.sql`  
Changes to the core newznab+ files are located in `newznab.patch`  

There are references to the newznab lib path in each of the plugins in `www/lib/smarty/plugins/` as well. You may need to correct the full path that is defined in these until they are coded into the newznab core. This is a temporary step... bare with us.

Configuration
-------------

In the `www/templates/writhem/theme.php` file you can set multiple options. Including color, titles and file locations.

Stylesheets are located in `www/templates/writhem/styles/`. All colors that could be changed are located in `color.css`. 

If you change your icon for cart, you may want to change the css for the js driven images as well. Located on line 169 and 170. 

    div.icon_cart			{ background-image:url('../images/icons/cartup.png'); }
    div.icon_cart_clicked	{ background-image:url('../images/icons/cartdown.png'); }

Don't forget to change your menu names in the admin panel as well. 

To utilize the Realtime Status functionality, make sure you define your logs in your theme.php. If you are not currently outputing the php update scripts to a log file you should edit your update scripts. You can start a new log file by following this little slice of code sample

    set -e

    export NEWZNAB_PATH="/usr/local/www/newznab/misc/update_scripts"
    export NEWZNAB_SLEEP_TIME="600" # in seconds
    LASTOPTIMIZE=`date +%s`
    LOGFILE="/var/www/newznab/misc/update_scripts/logs/updating.log"

    while :

     do
    CURRTIME=`date +%s`
    cd ${NEWZNAB_PATH}
    /usr/bin/php5 ${NEWZNAB_PATH}/update_binaries.php > $LOGFILE
    /usr/bin/php5 ${NEWZNAB_PATH}/update_releases.php >> $LOGFILE

    DIFF=$(($CURRTIME-$LASTOPTIMIZE))
    if [ "$DIFF" -gt 43200 ] || [ "$DIFF" -lt 1 ]
    then
        LASTOPTIMIZE=`date +%s`
        /usr/bin/php5 ${NEWZNAB_PATH}/optimise_db.php >> $LOGFILE
        /usr/bin/php5 ${NEWZNAB_PATH}/update_tvschedule.php >> $LOGFILE
        /usr/bin/php5 ${NEWZNAB_PATH}/update_theaters.php >> $LOGFILE
    fi

    rm -f $LOGFILE
    echo "waiting ${NEWZNAB_SLEEP_TIME} seconds..."
    sleep ${NEWZNAB_SLEEP_TIME}

    done


Screenshots
-----------

Green by default, but you can pick the colour you want with the colour selector... (as yet to be built, currently you're stuck editing color.css)  
![Green Theme](http://i.imgur.com/xsaGyJb.png)

Detailed NZB View for probably the best show ever made, anywhere   
![Detailed NZB View](http://i.imgur.com/Q4qV4MB.png)

Series season/episode cross browser. Switch between episodes and seasons easily without a page reload ![Series Cross Browser](http://i.imgur.com/JcMv8uB.png)

User Menu on left with realtime status below the catagory bar. You'll also notice the customizable menu break between PreDB and My Movies below:  
 ![Realtime Status](http://i.imgur.com/ThFb2ki.png)

Syndicated Comment with little icons for user level, and where it was posted if you're admin  
![Syndicated Comment Icons](http://i.imgur.com/LfXESTE.png)

View the files and rar contents from a tab, no more annoying popups:  
![File Contents](http://i.imgur.com/DN5bSrk.png)

Embeded NFOs  
![Embeded NFOs](http://i.imgur.com/Boj1it1.png)

Local Nukes! you can now mark something as a poor quality release or non-ideal without removing it from your db. This alerts your users of bad quality items:  
![LocalNuke](http://i.imgur.com/IoNVh8y.png)

In classic view you can see detailed quality indicators. More are coming, for now we have audio flags to show the language of the aduio tracks  
![Detailed media info](http://i.imgur.com/X6F04XA.png)