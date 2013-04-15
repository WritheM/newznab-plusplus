<?php
/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.writhem_spotnab_name.php
 * Type:     function
 * Name:     writhem_spotnab_name
 * Purpose:  returns the human readable name of a source based on the id. 
 * -------------------------------------------------------------
 */
function smarty_function_writhem_spotnab_name($params, Smarty_Internal_Template $template)
{
    if (!isset($params['id']))
        return false;
        
    require_once("/var/www/newznab/www/lib/framework/db.php");
    $db = new DB;
    
    $query = "SELECT description FROM `spotnabsources` "
           . "WHERE id = %d;";
           
	$result = $db->queryOneRow(sprintf($query, $params['id']));
    return $result['description'];    
}
?>
