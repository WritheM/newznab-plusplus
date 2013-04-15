<?php
require_once(WWW_DIR."/lib/framework/db.php");

/**
 * This class handles lookup of nzpre lookups and storage/retrieval of teevee data.
 */
class TeeVee
{
	/**
	 * Default constructor.
	 */
	function TeeVee($echooutput=true)
	{
		$this->echooutput = $echooutput;
        
        $db = new DB();
        $query = "CREATE TABLE IF NOT EXISTS `teevee` (
              `reqID` int(12) NOT NULL,
              `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
              `filledDate` datetime NOT NULL,
              `releaseID` int(12) NOT NULL DEFAULT '0',
              PRIMARY KEY (`reqID`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci";
        $db->query($query);
	}

	/**
	 * Process all untagged teevee rows to see if they are found in releases.
	 */
	public function processReleases($daysback = 5)
	{
		$db = new DB();
		
		if ($this->echooutput)
			echo "Teevee  : Updating releases with teevee req data..";

		$matched=0; $total = 0;
        $teeveeQuery = sprintf('SELECT * FROM teevee WHERE releaseID < 1 AND filledDate > DATE_SUB(NOW(), INTERVAL %d DAY)', $daysback);
        $teeveeResult = $db->queryDirect($teeveeQuery);
		while($teevee = $db->getAssocArray($teeveeResult))
		{
            $total++;
			$releaseQuery = sprintf("SELECT ID, searchname FROM releases WHERE searchname like '%s' LIMIT 1", $teevee['reqID']);
			$release = $db->queryOneRow($releaseQuery);
            
			if($release) 
			{
				$db->query(sprintf('UPDATE releases SET searchname = %s WHERE ID = %d', $db->escapeString($teevee['title']), $release['ID']));
				$db->query(sprintf('UPDATE teevee SET releaseID = %d WHERE reqID = %d', $release['ID'], $teevee['reqID']));
			
				$matched++;
                echo "\nTeevee  : UPDATED [".date('Y-m-d H:i:s', strtotime($teevee['filledDate'])).'] - [ '.$teevee['reqID'].' ] - ['.$teevee['title']."]";

			}
            if ($this->echooutput && $total % 25 == 0)
                echo $total.".";
                
		}
		
		if($this->echooutput)
			echo "\nTeevee  : Searched {$total} teevee reqs, Matched {$matched} releases\n";
		
        return true;
	}
	
    
    /**
	 * Get teevee data
	 */
	public function loadFromRemote($page=1)
	{  
		if($this->echooutput) 
			echo "Teevee  : Checking for new teevee requests that have been posted\n";
        
        // Create DOM from URL or file 
        /* 
        $url = 'http://news.writhem.com/test.html?page='.$page;
        /*/
        $url = 'http://abteevee.allfilled.com/reqs.php?fetch=posted&page='.$page;
        //*/

        // Populate the teeveeArray with data from the site
        $agent= 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17';
        $headers = array("Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
            "Accept-Charset: ISO-8859-1,*;q=0.3",
            //"Accept-Encoding: gzip,deflate,sdch",
            "Accept-Language: en-US,en;q=0.8",
            "Cache-Control: max-age=0"    );

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_VERBOSE, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_USERAGENT, $agent);
        curl_setopt($ch, CURLOPT_URL, $url);
        $remote=curl_exec($ch);
        
        $haystacks = explode('<td class="trigger_col">',$remote);
        
        // not really needed, and memory intensive, but i like my stuff in order in the db.
        //$haystacks = array_reverse($haystacks);
        
        foreach($haystacks as $haystack) 
        {
            $needle = '/<td class="cell_reqid">(\d*)<\/td>(?:.|[\r\n])*<td class="cell_request">(.*)<\/td>(?:.|[\r\n])*<td class="cell_statuschange">((?:\d|-| |:)*)<\/td>/';
            preg_match($needle, $haystack, $results);
            
            if (isset($results[1])) {
                $teevee = array(
                    'reqID'=>(int)$results[1],
                    'title'=>(string)$results[2],
                    'filledDate'=>(string)$results[3],
                    'releaseID'=>null
                );
                $this->updateReqID($teevee);
            }
        }        
    }
    
    /**
	 * Add/Update teevee row.
	 */
	public function updateReqID($teevee)
	{
        $db = new DB();
        
        if(isset($teevee['reqID']) && is_int($teevee['reqID'])) {
            if (isset($teevee['releaseID']))
                $query = sprintf('INSERT INTO teevee
                    (reqID, title, filledDate, releaseID)
                    VALUES (%d, %s, %s, %d)
                    ON DUPLICATE KEY UPDATE
                    title=%2$s, filledDate=%3$s, releaseID=%4$d',
                    (int)$teevee['reqID'],
                    $db->escapeString($teevee['title']),
                    $db->escapeString($teevee['filledDate']),
                    (int)$teevee['releaseID']);
            else
                $query = sprintf('INSERT INTO teevee
                    (reqID, title, filledDate)
                    VALUES (%d, %s, %s)
                    ON DUPLICATE KEY UPDATE
                    title=%2$s, filledDate=%3$s',
                    (int)$teevee['reqID'],
                    $db->escapeString($teevee['title']),
                    $db->escapeString($teevee['filledDate']));
                    
            $db->query($query);
            $newCheck = mysql_affected_rows();			
            if($this->echooutput && $newCheck > 0)
                echo "Teevee  : NEW [".date('Y-m-d H:i:s', strtotime($teevee['filledDate'])).'] - [ '.$teevee['reqID'].' ] - ['.$teevee['title']."]\n";
        
            return true;
        }
        return false;
	}


}