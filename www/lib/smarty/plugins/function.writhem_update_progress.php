<?php
/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.writhem_update_progress.php
 * Type:     function
 * Name:     writhem_update_progress
 * Purpose:  returns the guid based on a comment's id when only a gid is present. 
 * -------------------------------------------------------------
 */
function smarty_function_writhem_update_progress($params, Smarty_Internal_Template $template)
{
$files = $params['update_logs'];

foreach ($files as $file) {
    $filename = $file[0];
    if (file_exists($filename)) {
        $update_sec_ago = (time() - filemtime($filename))/60;
        
        //$title = $file[1] . ' - Last update: ' . sinceTime(filemtime($filename));
        if ($update_sec_ago < 360) // 6h
        {
            $icon = 'green.png';
            $title = $file[1] . ' - Scanning';
        }
        elseif ($update_sec_ago < 1440) // 1d
        { 
            $icon = 'orange.png';
            $title = $file[1] . ' - Last added ' . sinceTime(filemtime($filename)) . ' ago';
        }
        elseif ($update_sec_ago < 10080) // 1w
        {
            $icon = 'red.png';
            $title = $file[1] . ' - Stalled';
        }
        else
        {
            $icon = 'black.png';
            $title = $file[1] . ' - Paused';
        }
        // $data = file($filename);
        // $line = sinceTime(filemtime($filename)) . " ago:" . $data[count($data)-1];
    } else {
        $icon = 'black.png';
            $title = $file[1] . ' - Paused';
    }
    
    echo "<img src='".WWW_TOP."/templates/writhem/images/status/$icon' title='$title'>";
}


}
function sinceTime ($time)
{
    $time = time() - $time; // to get the seconds since that moment
    $tokens = array (
        31536000 => 'year',
        2592000 => 'month',
        604800 => 'week',
        86400 => 'day',
        3600 => 'hour',
        60 => 'minute',
        1 => 'second'
    );

    foreach ($tokens as $unit => $text) {
        if ($time < $unit) continue;
        $numberOfUnits = floor($time / $unit);
        return $numberOfUnits.' '.$text.(($numberOfUnits>1)?'s':'');
    }
}
?>
