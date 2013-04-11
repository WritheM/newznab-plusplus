<?php
/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.writhem_assign_reAudio.php
 * Type:     function
 * Name:     writhem_assign_reAudio
 * Purpose:  returns an array of flags for the passsed release id. 
 * -------------------------------------------------------------
 */
function smarty_function_writhem_assign_reAudio($params, Smarty_Internal_Template $template)
{
    require_once("/var/www/newznab/www/lib/releaseextra.php");
    $re = new ReleaseExtra;
    $result = $re->getAudio($params['id']);
    
    foreach($result as $key => $value) {
        $result[$key]['audioflag'] = '';
        if ($result[$key]['audiolanguage'] == 'English')
            $result[$key]['audioflag'] = 'flag flag-gb';
        elseif ($result[$key]['audiolanguage'] == 'English (US)')
            $result[$key]['audioflag'] = 'flag flag-us';
        elseif ($result[$key]['audiolanguage'] == 'German')
            $result[$key]['audioflag'] = 'flag flag-de';
        elseif ($result[$key]['audiolanguage'] == 'Dutch')
            $result[$key]['audioflag'] = 'flag flag-dk';
        elseif ($result[$key]['audiolanguage'] == 'French')
            $result[$key]['audioflag'] = 'flag flag-fr';
        elseif ($result[$key]['audiolanguage'] == 'Czech')
            $result[$key]['audioflag'] = 'flag flag-cz';
        elseif ($result[$key]['audiolanguage'] == 'Japanese')
            $result[$key]['audioflag'] = 'flag flag-jp';				
        elseif ($result[$key]['audiolanguage'] == 'Chinese')
            $result[$key]['audioflag'] = 'flag flag-cn';				
        elseif ($result[$key]['audiolanguage'] == 'Spanish')
            $result[$key]['audioflag'] = 'flag flag-es';				
        elseif ($result[$key]['audiolanguage'] == 'Swedish')
            $result[$key]['audioflag'] = 'flag flag-se';				
            
        elseif ($result[$key]['audiolanguage'] != '') // default to icon-flag
            $result[$key]['audioflag'] = 'icon-flag';
    }
    
    $template->assign('reAudio', $result);
}
?>
