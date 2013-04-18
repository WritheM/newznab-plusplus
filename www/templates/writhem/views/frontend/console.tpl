 
<h1>Browse Console</h1>

<form name="browseby" action="console">
<table border="0" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="title">Title</label></span>
				<input class="span2" id="title" type="text" name="title" value="{$title}" />
			</div>
		</td>
		<td style="display:none;">
			<div class="input-prepend">
				<span class="add-on"><label for="platform">Platform</label></span>
				<input class="span2" id="platform" type="text" name="platform" value="{$platform}" />
			</div>
		</td>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="genre">Genre</label></span>
				<select class="span2" id="genre" name="genre">
					<option class="grouping" value=""></option>
					{foreach from=$genres item=gen}
						<option {if $gen.ID == $genre}selected="selected"{/if} value="{$gen.ID}">{$gen.title}</option>
					{/foreach}
				</select>
			</div>
		</td>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="category">Category</label></span>
				<select class="span3 id="category" name="t">
					<option class="grouping" value="1000"></option>
					{foreach from=$catlist item=ct}
						<option {if $ct.ID==$category}selected="selected"{/if} value="{$ct.ID}">{$ct.title}</option>
					{/foreach}
				</select>
			</div>
		</td>
	</tr>
	<tr>
		<td><button class="btn" type="submit"><i class="icon-filter"></i> Apply Filter</button>
	</tr>
</table>
</form>

{if !$userdata.hideads && $site->adbrowse != ""}
<table class="adblock" cellspacing="0" cellpadding="0"><tr><td>{$site->adbrowse}</td></tr></table><br />
{/if}

{if $results|@count > 0}

<form id="nzb_multi_operations_form" action="get">

<table width="100%">
<tr><td>
{$pager}</td>
	<td style="text-align:right"><div class="nzb_multi_operations">
	<small>With selected:</small><div class="btn-group">
	<button type="button" class="btn btn-mini nzb_multi_operations_download"><i class="icon-download"></i> Download NZBs</button>
	<button type="button" class="btn btn-mini nzb_multi_operations_cart"><i class="{$themevars.cart_icon}"></i> {$themevars.cart_name_add}</button>
	{if $sabintegrated}<button type="button" class="btn btn-mini nzb_multi_operations_sab"><i class="icon-download-alt"></i> Send to SAB</button>{/if}
	{if $isadmin}
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_edit"><i class="icon-edit icon-white"></i></button>
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_delete"><i class="icon-trash icon-white"></i></button>
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_rebuild"><i class="icon-repeat icon-white"></i></button>
	{/if}</div>
	<div class="btn-group"><span class="btn btn-mini active"><i class="icon-picture"></i></span><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/browse?t={$category}" title="List"><i class="icon-list"></i></a>	
</div>

</div></td></tr></table>

<table style="width:100%;" class="table table-bordered table-striped data highlight icons" id="coverstable">
	<tr>
		<th width="130"><input type="checkbox" class="nzb_check_all" /></th>
		<th>title<br/><a title="Sort Descending" href="{$orderbytitle_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbytitle_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
		<th>platform<br/><a title="Sort Descending" href="{$orderbyplatform_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbyplatform_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
		<th>genre<br/><a title="Sort Descending" href="{$orderbygenre_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbygenre_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
		<th>release date<br/><a title="Sort Descending" href="{$orderbyreleasedate_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbyreleasedate_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
		<th>posted<br/><a title="Sort Descending" href="{$orderbyposted_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbyposted_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
		<th>size<br/><a title="Sort Descending" href="{$orderbysize_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbysize_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
		<th>files<br/><a title="Sort Descending" href="{$orderbyfiles_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbyfiles_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
		<th>stats<br/><a title="Sort Descending" href="{$orderbystats_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbystats_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
	</tr>

	{foreach from=$results item=result}
		<tr>
			<td class="mid">
				<div class="movcover">
				<a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">
					<img class="img-polaroid" src="{$smarty.const.WWW_TOP}/covers/console/{if $result.cover == 1}{$result.consoleinfoID}.jpg{else}no-cover.jpg{/if}" width="120" border="0" alt="{$result.title|escape:"htmlall"}" />
				</a>
				<div class="movextra"><div class="btn-group">
					{if $result.nfoID > 0}<a href="{$smarty.const.WWW_TOP}/nfo/{$result.guid}" title="View Nfo" class="btn btn-mini modal_nfo" rel="nfo">Nfo</a>{/if}
					{if $result.url != ""}<a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}{$result.url}" name="amazon{$result.consoleinfoID}" title="View amazon page">Amazon</a>{/if}
					<a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/browse?g={$result.group_name}" title="Browse releases in {$result.group_name|replace:"alt.binaries":"a.b"}">Grp</a></div>
				</div>
				</div>
			</td>
			<td colspan="8" class="left" id="guid{$result.guid}">
				<h2><a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">{$result.title|escape:"htmlall"} - {$result.platform|escape:"htmlall"}</a></h2>
				{if $result.genre != ""}<b>Genre:</b> {$result.genre}<br />{/if}
				{if $result.esrb != ""}<b>Rating:</b> {$result.esrb}<br />{/if}
				{if $result.publisher != ""}<b>Publisher:</b> {$result.publisher}<br />{/if}
				{if $result.releasedate != ""}<b>Released:</b> {$result.releasedate|date_format}<br />{/if}
				{if $result.review != ""}<b>Review:</b> {$result.review|escape:'htmlall'}<br />{/if}
				<br />
				<div class="movextra">
					<b>{$result.searchname|escape:"htmlall"}</b> <div class="btn-group"><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/console?platform={$result.platform}" title="View similar nzbs">Similar</a>
					{if $isadmin}
						<a class="btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/admin/release-edit.php?id={$result.releaseID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Edit Release">Edit</a> <a class="btn btn-mini btn-danger confirm_action" href="{$smarty.const.WWW_TOP}/admin/release-delete.php?id={$result.releaseID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Delete Release">Del</a>
					{/if}</div>
					<br />
					<b>Info:</b> {$result.postdate|timeago},  {$result.size|fsize_format:"MB"},  <a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$result.guid}">{$result.totalpart} files</a>,  
            <span{if $result.comments < 1} style="opacity:0.2;"{/if}><a title="View comments for {$result.searchname|escape:"htmlall"}" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/#comments">{writhem_browse_comment_count guid=$result.guid}<i class="icon-comment"></i></a></span>,
            <span{if $result.grabs < 1} style="opacity:0.2;"{/if}>{$result.grabs}<i class="icon-download"></i></span>
					<br />
					<div class="icon"><input type="checkbox" class="nzb_check" value="{$result.guid}" /></div>
					<div class="icon icon_nzb"><a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$result.guid}/{$result.searchname|escape:"htmlall"}">&nbsp;</a></div>
					<div class="icon icon_cart" title="{$themevars.cart_name_add}"></div>
					{if $sabintegrated}<div class="icon icon_sab" title="Send to my Sabnzbd"></div>{/if}
				</div>
			</td>
		</tr>
	{/foreach}
</table>

<table width="100%">
<tr><td>
{$pager}</td>
	<td style="text-align:right"><div class="nzb_multi_operations">
	<small>With selected:</small><div class="btn-group">
	<button type="button" class="btn btn-mini nzb_multi_operations_download"><i class="icon-download"></i> Download NZBs</button>
	<button type="button" class="btn btn-mini nzb_multi_operations_cart"><i class="{$themevars.cart_icon}"></i> {$themevars.cart_name_add}</button>
	{if $sabintegrated}<button type="button" class="btn btn-mini nzb_multi_operations_sab"><i class="icon-download-alt"></i> Send to SAB</button>{/if}
	{if $isadmin}
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_edit"><i class="icon-edit icon-white"></i></button>
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_delete"><i class="icon-trash icon-white"></i></button>
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_rebuild"><i class="icon-repeat icon-white"></i></button>
	{/if}</div>
</div>

</div></td></tr></table>

</form>

{/if}

<br/><br/><br/>
