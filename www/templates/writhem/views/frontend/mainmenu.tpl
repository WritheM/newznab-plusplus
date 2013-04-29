{if $menulist|@count > 0} 
<li class="menu_main">
    {if $loggedin=="true" && $themevars.update_logs}
    <h2>Realtime Status</h2>
    <center>
    {foreach from=$themevars.update_logs item=file}
      {assign var="icon" value="black.png"}
      {assign var="title" value="{$file[1]} - Paused"}
      {if file_exists($file[0])}
        {assign var="update_sec_ago" value=(time() - filemtime($file[0]))/60}
        {if $update_sec_ago < 360}
            {assign var="icon" value="green.png"}
            {assign var="title" value="{$file[1]} - Scanning"}
        {elseif $update_sec_ago < 1440}
            {assign var="icon" value="orange.png"}
            {assign var="title" value="{$file[1]} - Lagging"}
        {elseif $update_sec_ago < 10080}
            {assign var="icon" value="red.png"}
            {assign var="title" value="{$file[1]} - Stalled"}
        {/if}
      {/if}
      <img src='{$smarty.const.WWW_TOP}/templates/writhem/images/status/{$icon}' title='{$title}'>
    {/foreach}
    </center>
    {/if}
	<h2>Menu</h2> 
	<ul class="nav nav-tabs nav-stacked">
	{foreach from=$menulist item=menu}
		{assign var="var" value=$menu.menueval}	
		{eval var="$var," assign='menuevalresult'}
		{if $menuevalresult|replace:",":"1" == "1"}
            {if $menu.title == "<hr>"}
                </ul>
                <ul class="nav nav-tabs nav-stacked">
            {elseif $menu.title == "Admin"} 
                <li class="mmenu{if $menu.newwindow =="1"}_new{/if}"><a title="Admin Home" href="{$smarty.const.WWW_TOP}/admin"><div class="icon icon_bullet"></div> Admin Home</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle"
                       data-toggle="dropdown"
                       href="#">
                        <div class="icon icon_bullet"></div> Admin Menu
                        <b class="caret"></b>
                      </a>
                    <ul class="dropdown-menu pull-up">
                        <li class="mmenu{if $menu.newwindow =="1"}_new{/if}"><a title="Admin Home" href="{$smarty.const.WWW_TOP}/admin"><div class="icon icon_bullet"></div> Admin Home</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/site-edit.php" title="Edit Site"><div class="icon icon_bullet"></div> Edit Site</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/content-list.php"><div class="icon icon_bullet"></div> Content Pages</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/menu-list.php"><div class="icon icon_bullet"></div> Menu Items</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/category-list.php"><div class="icon icon_bullet"></div> Categories</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/group-list.php"><div class="icon icon_bullet"></div> Groups</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/regex-list.php"><div class="icon icon_bullet"></div> Regex</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/binaryblacklist-list.php"><div class="icon icon_bullet"></div> Blacklist</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/release-list.php"><div class="icon icon_bullet"></div> Releases</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/rage-list.php"><div class="icon icon_bullet"></div> TVRage List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/thetvdb-list.php"><div class="icon icon_bullet"></div> TheTVDB List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/movie-list.php"><div class="icon icon_bullet"></div> Movie List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/anidb-list.php"><div class="icon icon_bullet"></div> AniDB List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/music-list.php"><div class="icon icon_bullet"></div> Music List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/console-list.php"><div class="icon icon_bullet"></div> Console List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/book-list.php"><div class="icon icon_bullet"></div> Book List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/nzb-import.php"><div class="icon icon_bullet"></div> Import Nzbs</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/db-optimise.php"><div class="icon icon_bullet"></div> Optimise Tables</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/spotnab-list.php"><div class="icon icon_bullet"></div> Spotnab Sources</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/comments-list.php"><div class="icon icon_bullet"></div> Comments</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/user-list.php"><div class="icon icon_bullet"></div> Users</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/role-list.php"><div class="icon icon_bullet"></div> Roles</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/site-stats.php"><div class="icon icon_bullet"></div> Site Stats</a></li>
                    </ul>
                </li>
            {else}
                <li class="tint mmenu{if $menu.newwindow =="1"}_new{/if}">
                  
                  <a {if $menu.newwindow =="1"}class="external" target="_blank"{/if} title="{$menu.tooltip}" href="{$menu.href}">
                    <div class="icon icon_bullet"></div> {$menu.title}
                  </a>
                </li>
            {/if}
		{/if}
	{/foreach}
	</ul>
</li>
{/if}
