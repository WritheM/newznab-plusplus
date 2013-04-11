


<h1>My Bookmarks</h1>

<p>
Your bookmarks can be downloaded as an <a href="{$smarty.const.WWW_TOP}/rss?t=-2&amp;dl=1&amp;i={$userdata.ID}&amp;r={$userdata.rsstoken}&amp;del=1">Rss Feed</a>.
</p>


{if $results|@count > 0}

<form id="nzb_multi_operations_form" action="get">



<form id="nzb_multi_operations_form" action="get">

<table width="100%">
<tr><td>
{$pager}</td>
	<td style="text-align:right"><div class="nzb_multi_operations">

	<small>With selected:</small><div class="btn-group">
	<button type="button" class="btn btn-mini nzb_multi_operations_download"><i class="icon-download"></i> Download NZBs</button>
	{if $sabintegrated}<button type="button" class="btn btn-mini nzb_multi_operations_cartsab"><i class="icon-download-alt"></i> Send to SAB</button>{/if}	
	<button type="button" class="btn btn-mini nzb_multi_operations_cartdelete"><i class="icon-remove"></i> Remove</button>

	</div>
</div>

</div></td></tr></table>

<table style="width:100%;" class="table table-bordered table-hover table-striped data highlight" id="browsetable">
	<tr>
		<th width="50"><input id="chkSelectAll" type="checkbox" class="nzb_check_all" /><label for="chkSelectAll" style="display:none;">Select All</label></th>
		<th>Release</th>
		<th>Added</th>
		<th>Options</th>
	</tr>

	{foreach from=$results item=result}
		<tr class="{cycle values=",alt"}">
			<td class="check">
				<input id="chk{$result.guid|substr:0:7}" type="checkbox" class="nzb_check" value="{$result.guid}" />
			</td>
			<td>
				<a title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">{$result.searchname|escape:"htmlall"|wordwrap:75:"\n":true}</a>
			</td>
			<td class="less" title="Added on {$result.createddate}">{$result.createddate|date_format}</td>
			<td><a class="btn btn-small" title="Delete from your Bookmarks" href="?delete={$result.guid}"><i class="icon-remove"></i> Remove</a></td>
		</tr>
	{/foreach}
	
</table>
</form>

{else}




<h2>No NZBs have been bookmarked</h2>
{/if}
