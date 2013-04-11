<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $error != ''}
	<div class="alert alert-error"><strong>Error!</strong> {$error}</div>
{/if}

<form class="form-horizontal" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<div class="control-group">
		<label class="control-label" for="groupname">Group</label>
		<div class="controls">
			<input type="hidden" name="id" value="{$regex.ID}" />
			<input class="input input-xxlarge" type="text" id="groupname" name="groupname" value="{$regex.groupname|escape:html}" />
			<span class="help-block">The full name of a valid newsgroup. (Wildcard in the format <code>alt.binaries.*</code>)</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="regex">Regex</label>
		<div class="controls">
			<textarea class="input input-xxlarge" cols="100" rows="3" id="regex" name="regex" >{$regex.regex|escape:html}</textarea>
			<span class="help-block">The regex to be applied. (Note: Beginning and Ending / are already included)</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="description">Description</label>
		<div class="controls">
			<textarea class="input input-xxlarge" cols="100" rows="3" id="description" name="description" >{$regex.description|escape:html}</textarea>
			<span class="help-block">A description for this regex</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="msgcol">Message Field</label>
		<div class="controls">
			{html_radios id="msgcol" name='msgcol' values=$msgcol_ids output=$msgcol_names selected=$regex.msgcol separator=''}
			<span class="help-block">Which field in the message to apply the black/white list to.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="status">Active</label>
		<div class="controls">
			{html_radios id="status" name='status' values=$status_ids output=$status_names selected=$regex.status separator=''}
			<span class="help-block">Only active regexes are applied during the release process.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="optype">Type</label>
		<div class="controls">
			{html_radios id="optype" name='optype' values=$optype_ids output=$optype_names selected=$regex.optype separator=''}
			<span class="help-block">Black will exclude all messages for a group which match this regex. White will include only those which match.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" ></label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>

</form>