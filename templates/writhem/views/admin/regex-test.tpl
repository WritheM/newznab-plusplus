<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $error != ''}
	<div class="error">{$error}</div>
{/if}

<form class="form-horizontal" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<div class="control-group">
		<label class="control-label">Group</label>
		<div class="controls">
			<select name="groupname" class="input input-xxlarge">
			{html_options  values=$gid output=$gname selected=$gselected}
			</select>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="regex">Regex</label>
		<div class="controls">
			<input class="input input-xxlarge" id="regex" name="regex" class="long" value="{$gregex|escape:html}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label"></label>
		<div class="controls">
			<input type="checkbox" name="unreleased"{if $gunreleased == 'on'}checked="checked"{/if} /> Ignore binaries that are released, duplicates, or already matched by a regex
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label"></label> 
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Test Regex" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-info" href="{$smarty.const.WWW_TOP}/regex-edit.php?action=addtest&regex={$gregex|urlencode}&groupname={$gname.$gselected}">Add Regex</a>
		</div>
	</div>
</form>

{if $matches}
{$pager}
<table style="margin-top:10px;" class="data Sortable highlight table table-striped">

	<tr>
		<th>ID</th>
		<th>name</th>
		<th>req</th>
		<th>parts</th>
		<th>count</th>
		<th>cat</th>
	</tr>
	
	{foreach from=$matches item=match}
	<tr class="{cycle values=",alt"}">
		<td>{$match.bininfo.binID}</td>
		<td>{$match.name|escape:html}<br /><small>{$match.bininfo.binName|escape:html}</small></td>
		<td>{$match.reqid}</td>
		<td>{$match.parts}</td>
		<td>{$match.count}</td>
		<td>{$match.catname}</td>
	</tr>
	{/foreach}

</table>
<br />{$pager}
{/if}