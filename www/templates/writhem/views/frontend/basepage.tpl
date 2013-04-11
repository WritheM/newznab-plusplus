<!DOCTYPE html>
<html lang="en">

<!--[if IE 6]>
    <link href="ie6.min.css" rel="stylesheet">
<![endif]-->

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	{if $loggedin=="true"}<meta name="keywords" content="{$page->meta_keywords}{if $page->meta_keywords != "" && $site->metakeywords != ""},{/if}{$site->metakeywords}" />{/if}
	<meta name="description" content="{$page->meta_description}{if $page->meta_description != "" && $site->metadescription != ""} - {/if}{if $loggedin=="true"}{$site->metadescription}{/if}" />	
	<meta name="robots" content="noindex,nofollow"/>
	{if $loggedin=="true"}<meta name="application-name" content="newznab-{$site->version}" />{/if}
	<title>{$page->meta_title}{if $page->meta_title != "" && $site->metatitle != ""} - {/if}{$site->metatitle}</title>
{if $loggedin=="true"}	<link rel="alternate" type="application/rss+xml" title="{$site->title} Full Rss Feed" href="{$smarty.const.WWW_TOP}/rss?t=0&amp;dl=1&amp;i={$userdata.ID}&amp;r={$userdata.rsstoken}" />{/if}






{if $site->google_adsense_acc != ''}	
	<link href="http://www.google.com/cse/api/branding.css" rel="stylesheet" type="text/css" media="screen" />
{/if}
	
	<link href="{$smarty.const.WWW_TOP}/templates/writhem/styles/style.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="{$smarty.const.WWW_TOP}/templates/writhem/styles/flags.css" rel="stylesheet" type="text/css" media="screen" />
	<!-- FAVICON -->

	<link rel="shortcut icon" type="image/ico" href="{$smarty.const.WWW_TOP}/templates/writhem/images/favicon.ico"/>
	<link rel="search" type="application/opensearchdescription+xml" href="{$smarty.const.WWW_TOP}/opensearch" title="{$site->title|escape}" />
	
	<!-- Javascripts -->
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/writhem/scripts/jquery.colorbox-min.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/writhem/scripts/jquery.qtip2.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/writhem/scripts/jquery.cookie.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/writhem/scripts/utils.js"></script>

	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/writhem/scripts/sorttable.js"></script>
	
	<!-- Added the Bootstrap JS -->
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/writhem/scripts/bootstrap.js"></script>
	
	<!-- Pines Notify -->
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/writhem/scripts/jquery.pnotify.js"></script>
	
	
	
	<script type="text/javascript">
	/* <![CDATA[ */	
		var WWW_TOP = "{$smarty.const.WWW_TOP}";
		var SERVERROOT = "{$serverroot}";
		var UID = "{if $loggedin=="true"}{$userdata.ID}{else}{/if}";
		var RSSTOKEN = "{if $loggedin=="true"}{$userdata.rsstoken}{else}{/if}";
	/* ]]> */		
	</script>
	{$page->head}
</head>
<body {$page->body}>

<!-- NAV
	================================================== -->

	{strip}
	<div id="statusbar">
		{if $loggedin=="true"}

			<div class="btn-group">
				<a class="btn" href="{$smarty.const.WWW_TOP}/profile">
				{if $userdata.role == 2}<i class="icon-font" title="Administrator"></i>
				{elseif $userdata.role == 6}<i class="icon-certificate" title="User has Donated"></i>
				{else}<i class="icon-user" title="Normal User"></i>
				{/if}&nbsp;
				{$userdata.username}</a> 
				<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="{$smarty.const.WWW_TOP}/profileedit"><i class="icon-edit"></i> Edit</a></li>
					<li><a href="{$smarty.const.WWW_TOP}/logout"><i class="icon-off"></i> Logoff</a></li>
				</ul>
			</div>
			<!--Welcome back <a href="{$smarty.const.WWW_TOP}/profile">{$userdata.username}</a>. <a href="{$smarty.const.WWW_TOP}/logout">Logout</a>-->
		{else}
			<a href="{$smarty.const.WWW_TOP}/login">Login</a> or <a href="{$smarty.const.WWW_TOP}/register">Register</a>
		{/if}
	</div>
	{/strip}

	<div id="logo">
		<a class="logolink" title="{$site->title} Logo" href="{$smarty.const.WWW_TOP}{$site->home_link}"><img class="logoimg" alt="{$site->title} Logo" src="{$smarty.const.WWW_TOP}/views/images/clearlogo.png" /></a>

		{if $site->menuposition==2}<ul>{$main_menu}</ul>{/if}

		<h1><a href="{$smarty.const.WWW_TOP}{$site->home_link}">{$site->title}</a></h1>
		{if $loggedin=="true"}<p><em>{$site->strapline}</em></p>{/if}
		
		<!--{if !$donated}
		<table class="adblock" cellspacing="0" cellpadding="0"><tr><td>-->{$site->adheader}<!--</td></tr></table><br />
		{/if}-->
		
	</div>
	<hr />
	
	<div id="header">
		<div id="menu"> 

			{if $loggedin=="true"}

















				{$header_menu}
			{/if}







						
		</div> 
	</div>
	
	<div id="page">
		
		<div id="content">
			{if gethostname() == 'nasbox'}
                <script>
                jQuery(document).ready(function() { 
                    var cookie = $.cookie('hide_beta');
                    if (cookie) {
                        jQuery('#alert_beta').hide();
                    }
                    var cookie = $.cookie('hide_ssl');
                    if (cookie) {
                        jQuery('#alert_ssl').hide();
                    }
                }); 
                </script>
				<div id="alert_beta" class="alert alert-note" >
				  <button type="button" class="close" onclick="$.cookie('hide_beta','true');jQuery('#alert_beta').hide(200);">&times;</button>
				  <strong>Note:</strong> You are on the beta server. Functionality and stability can not be gauranteed.
                </div>
      {else}
        {if $userdata.premium && substr($serverroot, 4, 1) != 's'}
          <div id="alert_ssl" class="alert alert-info">
            <button type="button" class="close" onclick="$.cookie('hide_ssl','true');jQuery('#alert_ssl').hide(200);">&times;</button>
            <strong>Warning!</strong> You are not connecting on SSL. Switch now? <a class="btn btn-mini" href="https://{$requesturl}"><i class="icon-refresh"></i> Switch to HTTPS</a>
          </div>
        {elseif !$userdata.premium && substr($serverroot, 4, 1) == 's' && $loggedin=="true"}
          <div id="alert_ssl" class="alert alert-error">
            <button type="button" class="close" onclick="$.cookie('hide_ssl','true');jQuery('#alert_ssl').hide(200);">&times;</button>
            <strong>Error!</strong> You are connecting on SSL, but have not donated more than the average. Switch now? <a class="btn btn-mini" href="http://{$requesturl}"><i class="icon-refresh"></i> Switch to HTTP</a>
          </div>
        {/if}
			{/if}
      {if $hasunreadnews && $loggedin=="true"}
                <div id="alert_news" class="alert alert-note">
				  <button type="button" class="close" onclick="$.cookie('hide_news','true');jQuery('#alert_news').hide(200);">&times;</button>
				  <strong>Note!</strong> You appear to have some unread news items. You can <a  href="{$smarty.const.WWW_TOP}{$site->home_link}">read them</a>, or <a href="?readnews" class="asynclink" onclick="jQuery('#alert_news').hide(200);">mark them as read</a>.
				</div>
            {/if}
			{$page->content}
		</div>










		<div id="sidebar">
			<ul>		
			
			{$main_menu}
			
			{$article_menu}
	
			{$useful_menu}
			
			{$recentposts_menu}
			

			{if $site->google_adsense_acc != '' && $site->google_adsense_search != ''}
			{literal}
				<li>
				<h2>Search for {/literal}{$site->term_plural}{literal}</h2> 
				<div style="padding-left:20px;">
					<div class="cse-branding-bottom" style="background-color:#FFFFFF;color:#000000">
					  <div class="cse-branding-form">
					    <form action="http://www.google.co.uk/cse" id="cse-search-box" target="_blank">
					      <div>
					        <input type="hidden" name="cx" value="partner-{/literal}{$site->google_adsense_acc}{literal}:{/literal}{$site->google_adsense_search}{literal}" />
					        <input type="hidden" name="ie" value="UTF-8" />
					        <input type="text" name="q" size="10" />
					        <input type="submit" name="sa" value="Search" />
					      </div>



					    </form>
					  </div>

					  <div class="cse-branding-logo">
					    <img src="http://www.google.com/images/poweredby_transparent/poweredby_FFFFFF.gif" alt="Google" />
					  </div>
					  <div class="cse-branding-text">
					    Custom Search
					  </div>
					</div>







				</div>
				</li>		
			{/literal}
			{/if}
			</ul>
		</div>

		<div style="clear: both;text-align:right;">
		</div>
  </div>

	<div class="footer">
	<p>
        &copy;{$smarty.now|date_format:"%Y"} {$site->title}, All Rights Reserved. <br/>
		{$site->footer}
    {if $loggedin=="true"}
      <br />Powered by <a title="newznab - A usenet indexing web application with community features." href="http://www.newznab.com/">newznab+</a>+ (the extra plus is for all the <a href="https://github.com/WritheM/newznab-plusplus/issues">WritheM Plugins <i class="fa-icon-github-alt"></i></a>)<br/>
          <a href="{$smarty.const.WWW_TOP}/terms-and-conditions">Terms and Conditions</a> | <a href="{$smarty.const.WWW_TOP}/content/5/">Privacy Policy</a>
      {if $db_parts[0]['count']>0}
      <br /><br />
          Indexing {$db_parts[0]['count']|number_format:0:".":","} Articles, {$db_binaries[0]['count']|number_format:0:".":","} Binaries, and {$db_releases[0]['count']|number_format:0:".":","} Releases.{/if}
      <br />
      {if ($userdata.admin)}
        ip: | 
        server:{gethostname()}
      {/if}
    {/if}
	</p>
	</div>
	{if $site->google_analytics_acc != ''}
	{literal}
	<script type="text/javascript">
	/* <![CDATA[ */	
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', '{/literal}{$site->google_analytics_acc}{literal}']);
	  _gaq.push(['_trackPageview']);
	  _gaq.push(['_trackPageLoadTime']);

	  (function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	/* ]]> */	
	</script>

	{/literal}
	{/if}

{if $loggedin=="true"}
<input type="hidden" name="UID" value="{$userdata.ID}" />
<input type="hidden" name="RSSTOKEN" value="{$userdata.rsstoken}" />
{/if}
	
</body>
</html>
