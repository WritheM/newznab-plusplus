<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $musiclist}
{$pager}

<table style="margin-top:10px;" class="data Sortable highlight table table-striped">

	<tr>
		<th>ID</th>
		<th>Title</th>
		<th>Artist</th>
		<th>Created</th>
	</tr>
	
	{foreach from=$musiclist item=music}
	<tr class="{cycle values=",alt"}">
		<td class="less">{$music.ID}</td>
		<td><a title="Edit" href="{$smarty.const.WWW_TOP}/music-edit.php?id={$music.ID}">{$music.title} ({$music.year})</a></td>
		<td>{$music.artist}</td>
		<td>{$music.createddate|date_format}</td>
	</tr>
	{/foreach}

</table>
{else}
<div class="alert">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<h4>Sorry!</h4>
	No Music available.
</div>
{/if}
