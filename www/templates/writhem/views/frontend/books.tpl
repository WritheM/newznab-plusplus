 
<h1>Browse Books</h1>

<form name="browseby" action="books">
<table border="0" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="author">Author</label></span>
				<input class="span2" id="author" type="text" name="author" value="{$author}" />
			</div>
		</td>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="title">Title</label></span>
				<input class="span2" id="title" type="text" name="title" value="{$title}" />
			</div>
		</td>
		<td><button class="btn btn-small" type="submit"><i class="icon-filter"></i> Apply Filter</button>
	</tr>
</table>
</form>
<p></p>

{if $site->adbrowse != ""}
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
	{if $userdata.admin}
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_edit"><i class="icon-edit icon-white"></i></button>
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_delete"><i class="icon-trash icon-white"></i></button>
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_rebuild"><i class="icon-repeat icon-white"></i></button>
	{/if}</div>
	<div class="btn-group"><span class="btn btn-mini active"><i class="icon-picture"></i></span><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/browse?t={$category}" title="List"><i class="icon-list"></i></a>	
</div></div></td></tr></table>

<table class="table table-bordered table-striped data highlight icons" style="width:100%;" id="coverstable">
	<tr>
		<th width="130"><input type="checkbox" class="nzb_check_all" /></th>
		<th>Author<br/><a title="Sort Descending" href="{$orderbyauthor_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbyauthor_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
		<th>Genre<br/><a title="Sort Descending" href="{$orderbygenre_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbygenre_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
		<th>Posted<br/><a title="Sort Descending" href="{$orderbyposted_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbyposted_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
	</tr>

	{foreach from=$results item=result}
		<tr class="{cycle values=",alt"}">
			<td class="mid">
				<div class="image-polaroid">
					<a class="title" href="{$site->dereferrer_link}{$result.url}">
						<img class="img-polaroid" src="{$smarty.const.WWW_TOP}/covers/book/{if $result.cover == 1}{$result.bookinfoID}.jpg{else}no-cover.jpg{/if}" width="120" border="0" alt="{$result.author|escape:"htmlall"} - {$result.title|escape:"htmlall"}" />
					</a>
					<div class="btn-group movextra">
						{if $result.url != ""}<a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}{$result.url}" name="amazon{$result.bookinfoID}" title="View amazon page">Amazon</a>{/if}
						<a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/browse?g={$result.group_name}" title="Browse releases in {$result.group_name|replace:"alt.binaries":"a.b"}">Grp</a>
					</div>
				</div>
			</td>
			<td colspan="3" class="left">
				<h2><a href="{$smarty.const.WWW_TOP}/books/?author={$result.author}">{$result.author|escape:"htmlall"}</a> - {$result.title|escape:"htmlall"}</h2>

				{if $result.review != ""}<span class="descinitial">{$result.review|escape:"htmlall"|nl2br|magicurl|truncate:"350":"</span><a class=\"descmore\" href=\"#\">more...</a>"}{if $result.review|strlen > 350}<span class="descfull">{$result.review|escape:"htmlall"|nl2br|magicurl}</span>{else}</span>{/if}<br /><br />{/if}
				
				{if $result.publisher != ""}<b>Publisher:</b> {$result.publisher|escape:"htmlall"}<br />{/if}
				{if $result.publishdate != ""}<b>Published:</b> {$result.publishdate|date_format}<br />{/if}
				{if $result.pages != ""}<b>Pages:</b> {$result.pages}<br />{/if}
				{if $result.isbn != ""}<b>ISBN:</b> {$result.isbn}<br />{/if}
				
				<div class="movextra">
					<table class="table table-hover">
						{assign var="msplits" value=","|explode:$result.grp_release_id}
						{assign var="mguid" value=","|explode:$result.grp_release_guid}
						{assign var="mnfo" value=","|explode:$result.grp_release_nfoID}
						{assign var="mgrp" value=","|explode:$result.grp_release_grpname}
						{assign var="mname" value="#"|explode:$result.grp_release_name}
						{assign var="mpostdate" value=","|explode:$result.grp_release_postdate}
						{assign var="msize" value=","|explode:$result.grp_release_size}
						{assign var="mtotalparts" value=","|explode:$result.grp_release_totalparts}
						{assign var="mcomments" value=","|explode:$result.grp_release_comments}
						{assign var="mgrabs" value=","|explode:$result.grp_release_grabs}
						{assign var="mpass" value=","|explode:$result.grp_release_password}
						{assign var="minnerfiles" value=","|explode:$result.grp_rarinnerfilecount}
						{assign var="mhaspreview" value=","|explode:$result.grp_haspreview}
						{foreach from=$msplits item=m}
						<tr id="guid{$mguid[$m@index]}" {if $m@index > 1}class="mlextra"{/if}>
							<td>
								<div class="icon"><input type="checkbox" class="nzb_check" value="{$mguid[$m@index]}" /></div>							
							</td>
							<td>
								<a href="{$smarty.const.WWW_TOP}/details/{$mguid[$m@index]}/{$mname[$m@index]|escape:"seourl"}">{$mname[$m@index]|escape:"htmlall"}</a>
								<div>
								Posted {$mpostdate[$m@index]|timeago},  {$msize[$m@index]|fsize_format:"MB"},  <a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$mguid[$m@index]}">{$mtotalparts[$m@index]} files</a>, 
                  <span{if $mcomments[$m@index] < 1} style="opacity:0.2;"{/if}><a title="View comments" href="{$smarty.const.WWW_TOP}/details/{$mguid[$m@index]}/#comments">{$mcomments[$m@index]}<i class="icon-comment"></i></a></span>, 
                  <span{if $mgrabs[$m@index] < 1} style="opacity:0.2;"{/if}>{$mgrabs[$m@index]}<i class="icon-download"></i></span>,								
								{if $mnfo[$m@index] > 0}<a href="{$smarty.const.WWW_TOP}/nfo/{$mguid[$m@index]}" title="View Nfo" class="modal_nfo" rel="nfo">Nfo</a>, {/if}
								{if $mpass[$m@index] == 1}Passworded, {elseif $mpass[$m@index] == 2}Potential Password, {/if}
								<a href="{$smarty.const.WWW_TOP}/browse?g={$mgrp[$m@index]}" title="Browse releases in {$mgrp[$m@index]|replace:"alt.binaries":"a.b"}">Grp</a>
								{if $mhaspreview[$m@index] == 1 && $userdata.canpreview == 1}, <a href="{$smarty.const.WWW_TOP}/covers/preview/{$mguid[$m@index]}_thumb.jpg" name="name{$mguid[$m@index]}" title="Screenshot of {$mname[$m@index]|escape:"htmlall"}" class="modal_prev" rel="preview">Preview</a>{/if}
								{if $minnerfiles[$m@index] > 0}, <a href="#" onclick="return false;" class="mediainfo" title="{$mguid[$m@index]}">Media</a>{/if}
								</div>
							</td>
							<td class="icons">
								<div class="icon icon_nzb"><a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$mguid[$m@index]}/{$mname[$m@index]|escape:"url"}">&nbsp;</a></div>
								<div class="icon {$themevars.cart_icon}" title="{$themevars.cart_name_add}"></div>
								{if $sabintegrated}<div class="icon icon_sab" title="Send to my Sabnzbd"></div>{/if}
							</td>
						</tr>
						{if $m@index == 1 && $m@total > 2}
							<tr><td colspan="5"><a class="mlmore" href="#">{$m@total-2} more...</a></td></tr>
						{/if}
						{/foreach}		
					</table>
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
	{if $userdata.admin}
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_edit"><i class="icon-edit icon-white"></i></button>
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_delete"><i class="icon-trash icon-white"></i></button>
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_rebuild"><i class="icon-repeat icon-white"></i></button>
	{/if}</div>
</div></div></td></tr></table>

</form>

{/if}

<br/><br/><br/>
