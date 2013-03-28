<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta name="keywords" content="" />
	<meta name="robots" content="noindex,nofollow"/>
	<meta name="description" content="" />	
	<title>{$site->title|default:'newznab'} - {$page->meta_title|default:$page->title}</title>

	<link href="{$smarty.const.WWW_TOP}/../templates/baffi/styles/style.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="{$smarty.const.WWW_TOP}/../templates/baffi/styles/admin.css" rel="stylesheet" type="text/css" media="screen" />	

	<link rel="shortcut icon" type="image/ico" href="{$smarty.const.WWW_TOP}/../templates/default/images/favicon.ico"/>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/../templates/default/scripts/sorttable.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/../templates/baffi/scripts/utils-admin.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/../templates/default/scripts/jquery.multifile.js"></script>
	<script type="text/javascript">var WWW_TOP = "{$smarty.const.WWW_TOP}/..";</script>
	
	<!-- Added the Bootstrap JS -->
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/../templates/baffi/scripts/bootstrap.js"></script>
	
	<!-- Pines Notify -->
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/../templates/baffi/scripts/jquery.pnotify.js"></script>
	
	{$page->head}	
</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner" style="padding-left:30px; padding-right:30px;">
			<div class="container">
				<a class="brand" href="{$smarty.const.WWW_TOP}/..{$site->home_link}">{$site->title}</a>
			</div>
		</div>
	</div>
	</br>
	</br>
	</br>
	
	<!-- Container
		================================================== -->
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span3">
					<ul style="margin: 0px;">
					{$admin_menu}

					</ul>
				</div>

				<div class="span9">
					{$page->content}
				</div>


			</div>
		</div>
	
	
	<!-- footer -->
	<footer class="footer navbar-fixed-bottom">
		<div class="container">
			<p>{$site->footer} All rights reserved {$smarty.now|date_format:"%Y"}</p>
			<ul class="footer-links">
				<li><a href="//github.com/Frikish/">Themed by Frikish <i class="fa-icon-github-alt"></i></a></li>
				<li class="muted">·</li>
				<li><a href="{$smarty.const.WWW_TOP}/terms-and-conditions">{$site->title} terms and conditions</a></li>
			</ul>
		</div>
	</footer>
	<!-- end #footer -->
	
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
	
</body>
</html>
