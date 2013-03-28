<?php
/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.writhem_admin_comments.php
 * Type:     function
 * Name:     writhem_admin_comments
 * Purpose:  returns the guid based on a comment's id when only a gid is present. 
 * -------------------------------------------------------------
 */
function smarty_function_writhem_admin_comments($params, Smarty_Internal_Template $template)
{
    if (!isset($params['id']))
        return false;
        
    require_once("/var/www/newznab/www/lib/framework/db.php");
    $db = new DB;
    
    $query = "SELECT r.guid FROM `releasecomment` as c "
           . "LEFT JOIN `releases` as r ON c.gid = r.gid "
           . "WHERE c.id = %d;";
           
	$result = $db->queryOneRow(sprintf($query, $params['id']));
    if (isset($result['guid']))
        $output = "<a class=\"btn btn-mini\" href=\"". WWW_TOP . "/../details/{$result['guid']}#comments\">view</a>";
    else
        $output = "<a class=\"btn btn-mini disabled\">none</a>";
    return $output;    
}
?>
