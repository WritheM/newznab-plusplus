<li class="nav-header">Navigate</li> 

<ul class="navigator">
	<li><a href="{$smarty.const.WWW_TOP}/..{$site->home_link}">Home</a><span class="divider">/</span></li>
	<li><a title="Admin Home" href="{$smarty.const.WWW_TOP}/">Admin Home</a></li>
</ul>

<li class="nav-header" style="padding-top: 15px;">Admin Functions</li> 

<ul class="navigator">
	<li class="active">Admin<span class="divider">/</span></li>
	<li><a title="Edit Site" href="{$smarty.const.WWW_TOP}/site-edit.php">Edit Site</a></li>
</ul>

<ul class="navigator">
	<li class="active">Content Page<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/content-list.php">View</a><span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/content-add.php?action=add">Add</a></li>
</ul>

<ul class="navigator">
	<li class="active">Menu Items<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/menu-list.php">View</a><span class="divider">/</span></li>
		<a style="padding:0;" href="{$smarty.const.WWW_TOP}/menu-edit.php?action=add">Add</a></li>
</ul>

<ul class="navigator">
	<li class="active">Categories<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/category-list.php?action=add">Edit</a></li>
</ul>

<ul class="navigator">
	<li class="active">Groups<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/group-list.php">View</a><span class="divider">/</span></li>
	<li><a style="padding:0;" href="{$smarty.const.WWW_TOP}/group-edit.php">Add</a><span class="divider">/</span></li>
	<li><a style="padding:0;" href="{$smarty.const.WWW_TOP}/group-bulk.php">BulkAdd</a></li>
</ul>

<ul class="navigator">
	<li class="active">Regex<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/regex-list.php">View</a><span class="divider">/</span></li>
	<li><a style="padding:0;" href="{$smarty.const.WWW_TOP}/regex-edit.php?action=add">Add</a><span class="divider">/</span></li>
	<li><a style="padding:0;" href="{$smarty.const.WWW_TOP}/regex-test.php">Test</a><span class="divider">/</span></li>
	<li><a style="padding:0;" href="{$smarty.const.WWW_TOP}/regex-submit.php">Send</a></li>
</ul>
	
<ul class="navigator">
	<li class="active">Blacklist<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/binaryblacklist-list.php">View</a><span class="divider">/</span></li>
	<li><a style="padding:0;" href="{$smarty.const.WWW_TOP}/binaryblacklist-edit.php?action=add">Add</a></li>
</ul>

<li class="nav-header" style="padding-top: 15px;">Content</li> 

<ul class="navigator">
	<li class="active">Releases<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/release-list.php">View</a></li>
</ul>

<ul class="navigator">
	<li class="active">TVRage List<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/rage-list.php">View</a><span class="divider">/</span></li>
	<li><a style="padding:0;" href="{$smarty.const.WWW_TOP}/rage-edit.php?action=add">Add</a></li>
</ul>
<ul class="navigator">
	<li class="active">TheTVDB List<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/thetvdb-list.php">View</a></li>
</ul>
<ul class="navigator">
	<li class="active">Movie List<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/movie-list.php">View</a><span class="divider">/</span></li>
	<li><a style="padding:0;" href="{$smarty.const.WWW_TOP}/movie-add.php">Add</a></li>
</ul>
<ul class="navigator">
	<li class="active">AniDB List<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/anidb-list.php">View</a></li>
</ul>
<ul class="navigator">
	<li class="active">Music List<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/music-list.php">View </a></li>
</ul>
<ul class="navigator">
	<li class="active">Console List<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/console-list.php">View</a></li>
</ul>
<ul class="navigator">
	<li class="active">Book List<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/book-list.php">View</a></li>
</ul>

<li class="nav-header" style="padding-top: 15px;">Extra</li> 
<ul class="navigator">
	<li class="active">Nzb's<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/nzb-import.php">Import</a><span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/nzb-export.php">Export</a></li>
</ul>
<ul class="navigator">
	<li class="active">Tables<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/db-optimise.php">Optimise</a></li>
</ul>
<ul class="navigator">
	<li class="active">Comments<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/comments-list.php">View</a></li>
</ul>
<ul class="navigator">
	<li class="active">Spotnab<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/spotnab-list.php">View</a><span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/spotnab-edit.php?action=add">Add</a></li>
</ul>
<ul class="navigator">
	<li class="active">Users<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/user-list.php">View</a><span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/user-edit.php?action=add">Add</a></li>
</ul>
<ul class="navigator">
	<li class="active">Roles<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/role-list.php">View</a><span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/role-edit.php?action=add">Add</a></li>
</ul>
<ul class="navigator">
	<li class="active">Misc<span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/site-stats.php">Site Stats</a><span class="divider">/</span></li>
	<li><a href="{$smarty.const.WWW_TOP}/site-debug.php">Debug</a></li>
</ul>
</li>

