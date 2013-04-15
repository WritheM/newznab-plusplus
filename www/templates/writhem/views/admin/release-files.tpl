<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<h3>For {$rel.searchname|escape:'htmlall'}</h3>

<table class="data Sortable table table-striped">

	<tr>
		<th>#</th>
		<th>filename</th>
		<th>size</th>
		<th>date</th>
	</tr>

	{foreach from=$binaries item=binary}
	<tr>
		<td width="20" title="{$binary.relpart}/{$binary.reltotalpart}">{$binary.relpart}</td>
		<td title="{$binary.name|escape:'htmlall'}">{$binary.filename}</td>
		<td class="less">{$binary.size|fsize_format:"MB"}</td>
		<td class="less" title="{$binary.date}">{$binary.date|date_format}</td>
	</tr>
	{/foreach}

</table>	