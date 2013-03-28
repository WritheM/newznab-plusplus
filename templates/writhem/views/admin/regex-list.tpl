<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<p>
	Regexs are applied to group message subjects into releases. The capture groups are named to hold the release name and number of parts.
	They are applied to messages from that group in order, then any general regexs are applied in order afterwards.
</p>
<p>
	If you want to apply a regex to a group and all its children then append an asterix a.b.blah* to the end. 
</p>

<div style="display:none;" id="message">msg</div>

<div class="navbar">
	<div class="navbar-inner">
		<form class="navbar-form pull-left" >
			{html_options id="regexGroupSelect" name=category options=$reggrouplist selected=$selectedgroup}
		</form>
	</div>
</div>

<table class="data Sortable highlight table table-bordered" style="table-layout:fixed;">

	<tr>
		<th style="width:25px;">id</th>
		<th style="width:100px;">group</th>
		<th >regex</th>
		<th style="width:100px;">category</th>
		<th style="width:50px;">status</th>
		<th style="width:60px;">releases</th>
		<th style="width:50px;">last match</th>
		<th style="width:50px;">ordinal</th>
		<th style="display:none;width:60px;">Order</th>
		<th style="width:80px;">Options</th>
	</tr>
	
	{foreach from=$regexlist item=regex}
	<tr id="row-{$regex.ID}" class="{cycle values=",alt"}">
		<td style="overflow:hidden;"><a id="{$regex.ID}"></a>{$regex.ID}</td>
		<td style="overflow:hidden;" title="{$regex.description}">{if $regex.groupname==""}all{else}{$regex.groupname|replace:"alt.binaries":"a.b"}{/if}</td>
		<td style="overflow:hidden;" title="Edit regex"><a href="{$smarty.const.WWW_TOP}/regex-edit.php?id={$regex.ID}">{$regex.regex|escape:html}</a><br>
			{$regex.description}</td>
		<td style="overflow:hidden;" title="{$regex.categoryID}">{if $regex.categoryID!=""}{$regex.categoryTitle}{/if}</td>
		<td style="overflow:hidden;">{if $regex.status==1}active{else}disabled{/if}</td>
		<td style="overflow:hidden;">{$regex.num_releases}</td>
		<td style="overflow:hidden;">{$regex.max_releasedate}</td>
		<td style="overflow:hidden;" >{$regex.ordinal}</td>
		<td style="display:none;"><a title="Move up" href="#">up</a> | <a title="Move down" href="#">down</a></td>
		<td style="overflow:hidden;">
			<div class="btn-group">
				<a class="btn btn-mini btn-danger" href="javascript:ajax_releaseregex_delete({$regex.ID})">Delete</a>
			{if $regex.groupname != ""}
				<a class="btn btn-mini btn-info" href="{$smarty.const.WWW_TOP}/regex-test.php?action=submit&groupname={$regex.groupID}&regex={$regex.regex|urlencode}">Test</a>
			{/if}
			</div>
		</td>
	</tr>
	{/foreach}


</table>
