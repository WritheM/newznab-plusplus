<li class="menu_useful"> 
	<h2>Useful Links</h2> 
	<ul class="nav nav-tabs nav-stacked">
    <li class="mmenu"><a title="Contact Us" href="{$smarty.const.WWW_TOP}/contact-us"><div class="icon icon_bullet"></div> Contact Us</a></li>
    <li class="mmenu"><a title="Site Map" href="{$smarty.const.WWW_TOP}/sitemap"><div class="icon icon_bullet"></div> Site Map</a></li>
    {if $loggedin=="true"}
    <li class="mmenu"><a title="Search Raw Headers" href="{$smarty.const.WWW_TOP}/searchraw"><div class="icon icon_bullet"></div> Raw Search</a></li>
    <li class="mmenu"><a title="{$site->title} Rss Feeds" href="{$smarty.const.WWW_TOP}/rss"><div class="icon icon_bullet"></div> Rss Feeds</a></li>
    <li class="mmenu"><a title="{$site->title} Api" href="{$smarty.const.WWW_TOP}/apihelp"><div class="icon icon_bullet"></div> Api</a></li>
    {/if}
    {foreach from=$usefulcontentlist item=content}
    <li class="mmenu{if $menu.newwindow =="1"}_new{/if}"><a {if $menu.newwindow =="1"}class="external" target="null"{/if} title="{$content.title}" href="{$smarty.const.WWW_TOP}/content/{$content.id}{$content.url}"><div class="icon icon_bullet"></div> {$content.title}</a></li>
    {/foreach}
	</ul>
</li>
