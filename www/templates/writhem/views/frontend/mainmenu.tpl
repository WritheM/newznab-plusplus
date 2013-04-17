{if $menulist|@count > 0} 
<li class="menu_main">
    {if $loggedin=="true" && $themevars.update_logs}
    <h2>Realtime Status</h2>
    <center>{writhem_update_progress update_logs=$themevars.update_logs}</center>
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
                <li class="mmenu{if $menu.newwindow =="1"}_new{/if}"><a title="Admin Home" href="{$smarty.const.WWW_TOP}/admin">Admin Home</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle"
                       data-toggle="dropdown"
                       href="#">
                        Admin Menu
                        <b class="caret"></b>
                      </a>
                    <ul class="dropdown-menu pull-up">
                        <li class="mmenu{if $menu.newwindow =="1"}_new{/if}"><a title="Admin Home" href="{$smarty.const.WWW_TOP}/admin">Admin Home</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/site-edit.php" title="Edit Site">Edit Site</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/content-list.php">Content Pages</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/menu-list.php">Menu Items</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/category-list.php">Categories</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/group-list.php">Groups</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/regex-list.php">Regex</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/binaryblacklist-list.php">Blacklist</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/release-list.php">Releases</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/rage-list.php">TVRage List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/thetvdb-list.php">TheTVDB List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/movie-list.php">Movie List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/anidb-list.php">AniDB List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/music-list.php">Music List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/console-list.php">Console List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/book-list.php">Book List</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/nzb-import.php">Import Nzbs</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/db-optimise.php">Optimise Tables</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/spotnab-list.php">Spotnab Sources</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/comments-list.php">Comments</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/user-list.php">Users</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/role-list.php">Roles</a></li>
                        <li><a href="{$smarty.const.WWW_TOP}/admin/site-stats.php">Site Stats</a></li>
                    </ul>
                </li>
            {else}
                <li class="tint mmenu{if $menu.newwindow =="1"}_new{/if}">
                  <a {if $menu.newwindow =="1"}class="external" target="_blank"{/if} title="{$menu.tooltip}" href="{$menu.href}">{$menu.title}</a>
                </li>
            {/if}
		{/if}
	{/foreach}
	</ul>
</li>
{/if}
