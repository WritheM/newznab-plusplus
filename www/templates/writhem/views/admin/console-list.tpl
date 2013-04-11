<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $consolelist}
{$pager}

<table style="margin-top:10px;" class="data Sortable highlight table table-striped">

	<tr>
		<th>ID</th>
		<th>Title</th>
		<th>Platform</th>
		<th>Created</th>
	</tr>
	
	{foreach from=$consolelist item=console}
	<tr class="{cycle values=",alt"}">
		<td class="less">{$console.ID}</td>
		<td><a title="Edit" href="{$smarty.const.WWW_TOP}/console-edit.php?id={$console.ID}">{$console.title}</a></td>
		<td>{$console.platform}</td>
		<td>{$console.createddate|date_format}</td>
	</tr>
	{/foreach}

</table>
{else}
<div class="alert">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<h4>Sorry!</h4>
	No games available.
</div>
{/if}
