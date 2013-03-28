<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $regex.ID > 0 && $regex.ID < 100000 && $site->reqidurl != ""}
	<div class="alert alert-error"><strong>Warning!</strong> Editing system regex, these changes will be overwritten next update releases.</div>
{/if}

{if $error != ''}
	<div class="alert alert-error"><strong>Error!</strong>{$error}</div>
{/if}

<form class="form-horizontal" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<div class="control-group">
		<label class="control-label" for="groupname">Group</label>
		<div class="controls">
			<input type="hidden" name="id" value="{$regex.ID}" />
			<input class="input input-xxlarge" type="text" id="groupname" name="groupname" value="{$regex.groupname|escape:html}" />
			<span class="help-block">The full name of a valid newsgroup. Use * to apply regex to all newsgroups.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="regex">Regex</label>
		<div class="controls">
			<textarea class="input input-xxlarge" cols="100" rows="5" id="regex" name="regex" >{$regex.regex|escape:html}</textarea>
			<span class="help-block">The regex to be applied.<br />
			Regex requires at least 1 named capturing group in the form of (?P&lt;name&gt;) to work.<br />
			If the subjects contains the number of parts (ie [1/10]) then it is wise to also use (?P&lt;parts&gt;) to match the parts.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="description">Description</label>
		<div class="controls">
			<textarea class="input input-xxlarge" cols="100" rows="5" id="description" name="description" >{$regex.description|escape:html}</textarea>
			<span class="help-block">A description for this regex</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="category">Category</label>
		<div class="controls">
			{html_options class="input input-xxlarge" id="category" name=category options=$catlist selected=$regex.categoryID}
			<span class="help-block">If this regex indicates the release category then supply it here. If left blank the standard method of determining the category will apply.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="ordinal">Ordinal</label>
		<div class="controls">
			<input class="input input-xxlarge" type="text" id="ordinal" class="short" name="ordinal" value="{$regex.ordinal|escape:html}" />
			<span class="help-block">The zero-based order in which the regex should be applied.</span>
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
		<label class="control-label" ></label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>

</form>