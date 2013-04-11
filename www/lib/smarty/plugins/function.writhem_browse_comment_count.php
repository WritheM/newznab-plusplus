<?php
/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.writhem_browse_comment_count.php
 * Type:     function
 * Name:     writhem_browse_comment_count
 * Purpose:  returns the count of comments for a releases guid. 
 * -------------------------------------------------------------
 */
function smarty_function_writhem_browse_comment_count($params, Smarty_Internal_Template $template)
{
    if (!isset($params['guid']))
        return false;
        
    require_once("/var/www/newznab/www/lib/framework/db.php");
    $db = new DB;
    
    $query_one = sprintf("SELECT COUNT(c.id) AS count FROM `releases` AS r
        RIGHT JOIN `releasecomment` AS c ON r.gid = c.gid
        WHERE r.guid = '%s';", $params['guid']);
    $query_two = sprintf("SELECT COUNT(c.id) AS count FROM `releases` AS r
        RIGHT JOIN `releasecomment` AS c ON r.id = c.releaseID
        WHERE r.guid = '%s' AND c.gid = NULL;", $params['guid']);
           
	$result_one = $db->queryOneRow($query_one);
	$result_two = $db->queryOneRow($query_two);

    return ($result_one['count'] + $result_two['count']);   
}
?>
