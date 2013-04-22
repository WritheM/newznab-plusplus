<?php

require_once('magpierss/rss_fetch.inc');
require_once('config.php');

$daysback = 7;
$echooutput = true;

echo "\nScraper : Stage 1 starting...";
//
// retrieve a list of feeds to be scraped
//
$result = mysql_query("SELECT *, NOW() as now FROM feed WHERE status=1");	
while ($row = mysql_fetch_assoc($result)) 
{
	if (strtotime($row['now']) - strtotime($row['lastupdate']) > $row['updatemins']*60) 
    {
        echo "\nScraper : Loading external information for ". $row['code'];
        $rss = fetch_rss($row["url"]);
        
        $upd = mysql_query("UPDATE feed SET lastupdate = NOW() WHERE ID = ".$row['ID']);
        
        //
        // scrape every item into a database table
        //
        foreach ($rss->items as $item) 
        {
            $link = "";
            if (isset($item['link']))
                $link = mysql_real_escape_string($item['link']);
            
            if (isset($item['description']))
                $description = mysql_real_escape_string($item['description']);	
            elseif (isset($item['summary']))
                $description = mysql_real_escape_string($item['description']);	
            else
                $description = "";
                
            $feedID = $row["ID"];
            
            if (isset($item['pubdate']))
                $pubdate = date("Y-m-d H:i:s", strtotime($item['pubdate']));
            elseif (isset($item["dc"]) && isset($item["dc"]["date"]))
                $pubdate = date("Y-m-d H:i:s", strtotime($item["dc"]["date"]));
            else
                $pubdate = date("Y-m-d H:i:s");
            
            //
            // store 'specific stuff' like parsed reqids by regexing
            //
            $reqid = 0;
            $matches = "";
        
            $title = "";
            if (preg_match($row["titleregex"], $item[$row["titlecol"]], $matches))
                $title = mysql_real_escape_string($matches["title"]);	
                        
            //straight md5
            if ($row["reqidregex"] == "-1" && $title != "")
            {
                $reqid = md5($title);
            }
            //regex reqid out of columns
            else
            {
                if (preg_match($row["reqidregex"], $item[$row["reqidcol"]], $matches))
                    $reqid = mysql_real_escape_string($matches["reqid"]);	
            }

            if (isset($item['guid']))
                $guid = mysql_real_escape_string($item['guid']);	
            else
            {
                if ($title != "" && $reqid != 0)
                    $guid = md5($reqid.$title);
                else
                    $guid = md5(uniqid());	
            }	
                
            $res = mysql_query("INSERT INTO item (feedID, reqid, title, link, description, pubdate, guid, adddate) VALUES ($feedID, '$reqid', '$title', '$link', '$description', '$pubdate', '$guid', NOW()) ON DUPLICATE KEY update reqid = '$reqid', title = '$title'");	
        }
    }
    
    echo "\nScraper : Searching releases in ". $row['code'] . " for " . $row['name'] . "...";
    $matched=0; $total = 0;
    $itemQuery = sprintf('SELECT i.reqid, i.title, i.adddate, f.code FROM item AS i LEFT JOIN feed AS f ON i.feedID = f.ID WHERE feedID = %d AND adddate > DATE_SUB(NOW(), INTERVAL %d DAY)', $row['ID'], $daysback);
    $itemResult = mysql_query($itemQuery);
    while($item = mysql_fetch_assoc($itemResult))
    { 
        foreach(explode(',',$item['code']) as $group)
        {
            $total++;
            $releaseQuery = sprintf("SELECT r.ID, r.searchname FROM releases AS r LEFT JOIN groups as g ON r.groupID = g.ID WHERE r.searchname LIKE '%s' AND g.name LIKE '%s' LIMIT 1", $item['reqid'], $group);
            $releaseResult = mysql_query($releaseQuery);
                        
            while($release = mysql_fetch_assoc($releaseResult))
            {
                mysql_query(sprintf('UPDATE releases SET searchname = %s WHERE ID = %d', escapeString($item['title']), $release['ID']));
            
                $matched++;
                echo "\nScraper : FOUND [ ".date('Y-m-d H:i:s', strtotime($item['adddate'])).' ] - [ '.$item['reqid']." ] - [ ".str_replace('a.b','alt.binaries',$group)." ] - [ {$item['title']} ]";

            }
            // if ($echooutput && $total % 100 == 0)
                // echo $total.".";
        }
    }
    
    if($echooutput)
        echo "\nScraper : Searched {$total} items, Matched {$matched} releases";
}

echo "\nScraper : Finshed\n";


function escapeString($str)
{
    return "'" . mysql_real_escape_string($str) . "'";
}

?>