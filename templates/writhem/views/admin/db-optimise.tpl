<div class="page-header">
	<h2>{$page->title}</h2>
</div>
<table style="margin-top:10px;" class="data Sortable table table-striped">

	<tr>
		<th>message</th>
	</tr>
	
	{foreach from=$tablelist item=table}
	<tr>
		<td>{$table} optimised/repaired</td>
	</tr>
	{/foreach}

</table>