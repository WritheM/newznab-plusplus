<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $groupmsglist}
<table class="data Sortable table table-striped">

	<tr>
		<th>group</th>
		<th>msg</th>
	</tr>
	
	{foreach from=$groupmsglist item=group}
	<tr>
		<td>{$group.group}</td>
		<td>{$group.msg}</td>
	</tr>
	{/foreach}

</table>

<p>View <a href="group-list.php">all groups</a>.</p>

{else}

<form class="form-horizontal" action="{$SCRIPT_NAME}?action=submit" method="POST">
	
	<div class="control-group">
		<label class="control-label" for="groupfilter">Group List</label>
		<div class="controls">
			<textarea cols="100" rows="3" class="input input-xlarge" id="groupfilter" name="groupfilter"></textarea>
			<span class="help-block">Regex of groups to add to the site. <br/>e.g. <code>alt.binaries.cd.image.linux|alt.binaries.warez.linux</code></span>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="active">Active</label>
		<div class="controls">
			{html_radios id="active" name='active' values=$yesno_ids output=$yesno_names selected=1 separator=''}
			<span class="help-block">Inactive groups will not have headers downloaded for them.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label"></label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Add Groups" />
		</div>
	</div>

</form>
{/if}