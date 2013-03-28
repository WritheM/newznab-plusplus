




 





<h1>Browse Music</h1>


<form name="browseby" action="music">
<table border="0" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="musicartist">Artist&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></span>
				<input class="span2" id="musicartist" type="text" name="artist" value="{$artist}" />
			</div>
		</td>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="musictitle">Title</label></span>
				<input class="span2" id="musictitle" type="text" name="title" value="{$title}" />
			</div>
		</td>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="genre">Genre</label></span>
				<select class="span2" id="genre" name="genre">
					<option class="grouping" value=""></option>
					{foreach from=$genres item=gen}
						<option {if $gen.ID == $genre}selected="selected"{/if} value="{$gen.ID}">{$gen.title|escape:"htmlall"}</option>
					{/foreach}
				</select>


			</div>
		</td>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="year">Year</label></span>
				<select class="span2" id="year" name="year">
					<option class="grouping" value=""></option>
					{foreach from=$years item=yr}
						<option {if $yr==$year}selected="selected"{/if} value="{$yr}">{$yr}</option>
					{/foreach}
				</select>


			</div>
		</td>
	</tr><tr>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="category">Category</label></span>
				<select class="span2" id="category" name="t">
					<option class="grouping" value="3000"></option>
					{foreach from=$catlist item=ct}
						<option {if $ct.ID==$category}selected="selected"{/if} value="{$ct.ID}">{$ct.title}</option>
					{/foreach}
				</select>




			</div>
		</td>
		<td><button class="btn btn-small" type="submit"><i class="icon-filter"></i> Apply Filter</button>
	</tr>
</table>
</form>
<p></p>

{if !$donated}
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
	<button type="button" class="btn btn-mini nzb_multi_operations_cart"><i class="icon-bookmark"></i> Bookmark</button>
	{if $sabintegrated}<button type="button" class="btn btn-mini nzb_multi_operations_sab"><i class="icon-download-alt"></i> Send to SAB</button>{/if}










	{if $isadmin}


		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_edit"><i class="icon-edit icon-white"></i></button>
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_delete"><i class="icon-trash icon-white"></i></button>



		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_rebuild"><i class="icon-repeat icon-white"></i></button>
	{/if}</div>
	<div class="btn-group"><span class="btn btn-mini active"><i class="icon-picture"></i></span><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/browse?t={$category}" title="List"><i class="icon-list"></i></a>	

</div></div></td></tr></table>









<table class="table table-bordered table-striped table-hover data highlight icons" style="width:100%;" id="coverstable">
	<tr>

		<th width="130"><input type="checkbox" class="nzb_check_all" /></th>


		<th>Artist<br/><a title="Sort Descending" href="{$orderbyartist_desc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_down.gif" alt="" /></a><a title="Sort Ascending" href="{$orderbyartist_asc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_up.gif" alt="" /></a></th>







		<th>Year<br/><a title="Sort Descending" href="{$orderbyyear_desc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_down.gif" alt="" /></a><a title="Sort Ascending" href="{$orderbyyear_asc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_up.gif" alt="" /></a></th>







		<th>Genre<br/><a title="Sort Descending" href="{$orderbygenre_desc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_down.gif" alt="" /></a><a title="Sort Ascending" href="{$orderbygenre_asc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_up.gif" alt="" /></a></th>







		<th>Posted<br/><a title="Sort Descending" href="{$orderbyposted_desc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_down.gif" alt="" /></a><a title="Sort Ascending" href="{$orderbyposted_asc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_up.gif" alt="" /></a></th>







		<th>Size<br/><a title="Sort Descending" href="{$orderbysize_desc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_down.gif" alt="" /></a><a title="Sort Ascending" href="{$orderbysize_asc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_up.gif" alt="" /></a></th>







		<th>Files<br/><a title="Sort Descending" href="{$orderbyfiles_desc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_down.gif" alt="" /></a><a title="Sort Ascending" href="{$orderbyfiles_asc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_up.gif" alt="" /></a></th>







		<th>Stats<br/><a title="Sort Descending" href="{$orderbystats_desc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_down.gif" alt="" /></a><a title="Sort Ascending" href="{$orderbystats_asc}"><img src="{$smarty.const.WWW_TOP}/views/images/sorting/arrow_up.gif" alt="" /></a></th>






	</tr>

	{foreach from=$results item=result}
		<tr class="{cycle values=",alt"}">
			<td class="mid">
				<div class="movcover">
				<a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">
					<img class="img-polaroid" src="{$smarty.const.WWW_TOP}/covers/music/{if $result.cover == 1}{$result.musicinfoID}.jpg{else}no-cover.jpg{/if}" width="120" border="0" alt="{$result.artist|escape:"htmlall"} - {$result.title|escape:"htmlall"}" />
				</a>
				<div class="btn-group movextra">

					{if $result.nfoID > 0}<a class="btn btn-mini modal_nfo" href="{$smarty.const.WWW_TOP}/nfo/{$result.guid}" title="View Nfo" rel="nfo">Nfo</a>{/if}
					{if $result.url != ""}<a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}{$result.url}" name="amazon{$result.musicinfoID}" title="View amazon page">Amazon</a>{/if}
					<a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/browse?g={$result.group_name}" title="Browse releases in {$result.group_name|replace:"alt.binaries":"a.b"}">Grp</a>

				</div>
				</div>
			</td>

			<td colspan="7" class="left" id="guid{$result.guid}">

				<h2><a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">{$result.artist|escape:"htmlall"} - {$result.title|escape:"htmlall"}</a> (<a class="title" title="{$result.year}" href="{$smarty.const.WWW_TOP}/music?year={$result.year}">{$result.year}</a>)</h2>






				{if $result.genre != ""}<b>Genre:</b> <a href="{$smarty.const.WWW_TOP}/music/?genre={$result.genreID}">{$result.genre|escape:"htmlall"}</a><br />{/if}
				{if $result.publisher != ""}<b>Publisher:</b> {$result.publisher|escape:"htmlall"}<br />{/if}
				{if $result.releasedate != ""}<b>Released:</b> {$result.releasedate|date_format}<br />{/if}
				{if $result.haspreview == 2 && $userdata.canpreview == 1}<b>Preview:</b> <a href="#" name="audio{$result.guid}" title="Listen to {$result.searchname|escape:"htmlall"}" class="audioprev btn btn-mini" rel="audio">Listen</a><audio id="audprev{$result.guid}" src="{$smarty.const.WWW_TOP}/covers/audio/{$result.guid}.mp3" preload="none"></audio>{/if}

				<br />
				<div class="movextra">
					<b>{$result.searchname|escape:"htmlall"}</b> <div class="btn-group"><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/music?artist={$result.artist|escape:"url"}" title="View similar nzbs">Similar</a>


					{if $isadmin}
						<a class="btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/admin/release-edit.php?id={$result.releaseID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Edit Release"><i class="icon-edit icon-white"></i></a> <a class="btn btn-mini btn-danger confirm_action" href="{$smarty.const.WWW_TOP}/admin/release-delete.php?id={$result.releaseID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Delete Release"><i class="icon-trash icon-white"></i></a>

					{/if}</div>

					<br />


					<b>Info:</b> {$result.postdate|timeago},  {$result.size|fsize_format:"MB"},  <a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$result.guid}">{$result.totalpart} files</a>,
            <span{if $result.comments < 1} style="opacity:0.2;"{/if}><a title="View comments for {$result.searchname|escape:"htmlall"}" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/#comments">{writhem_browse_comment_count guid=$result.guid}<i class="icon-comment"></i></a></span>,
            <span{if $result.grabs < 1} style="opacity:0.2;"{/if}>{$result.grabs}<i class="icon-download"></i></span>





					<br />
					<div class="icon"><input type="checkbox" class="nzb_check" value="{$result.guid}" /></div>
					<div class="icon icon_nzb"><a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$result.guid}/{$result.searchname|escape:"url"}">&nbsp;</a></div>
					<div class="icon icon_cart" title="Add to Bookmarks"></div>
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
	<button type="button" class="btn btn-mini nzb_multi_operations_cart"><i class="icon-bookmark"></i> Bookmark</button>
	{if $sabintegrated}<button type="button" class="btn btn-mini nzb_multi_operations_sab"><i class="icon-download-alt"></i> Send to SAB</button>{/if}










	{if $isadmin}


		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_edit"><i class="icon-edit icon-white"></i></button>
		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_delete"><i class="icon-trash icon-white"></i></button>



		<button type="button" class="btn btn-mini btn-danger nzb_multi_operations_rebuild"><i class="icon-repeat icon-white"></i></button>
	{/if}</div>
	<div class="btn-group"><span class="btn btn-mini active"><i class="icon-picture"></i></span><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/browse?t={$category}" title="List"><i class="icon-list"></i></a>	

</div></div></td></tr></table>







</form>

{/if}



<br/><br/><br/>
