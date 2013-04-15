<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<form class="form-horizontal" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<div class="control-group">
		<label class="control-label" for="title">Title</label>
		<div class="controls">
			<input type="hidden" name="id" value="{$content.id}" />
			<input class="input input-xxlarge" id="title" class="long" name="title" type="text" value="{$content.title}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="url">Url</label>
		<div class="controls">
			<input class="input input-xxlarge" id="url" class="long" name="url" type="text" value="{$content.url}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="body">Body</label>
		<div class="controls">
			<textarea class="input input-xxlarge"  cols="100" rows="3" id="body" name="body">{$content.body}</textarea>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="metadescription">Meta Description</label>
		<div class="controls">
			<textarea class="input input-xxlarge" cols="100" rows="3" id="metadescription" name="metadescription">{$content.metadescription}</textarea>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="metakeywords">Meta Keywords</label>
		<div class="controls">
			<textarea class="input input-xxlarge" cols="100" rows="3" id="metakeywords" name="metakeywords">{$content.metakeywords}</textarea>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="contenttype">Content Type</label>
		<div class="controls">
			{html_options class="input input-xxlarge" id="contenttype" name='contenttype' options=$contenttypelist selected=$content.contenttype}
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="role">Visible To</label>
		<div class="controls">
			{html_options class="input input-xxlarge" id="role" name='role' options=$rolelist selected=$content.role}
			<span class="help-block">Only appropriate for articles and useful links</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="showinmenu">Show In Menu</label>
		<div class="controls">
			{html_radios id="showinmenu" name='showinmenu' values=$yesno_ids output=$yesno_names selected=$content.showinmenu separator=''}
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="status">Status</label>
		<div class="controls">
			{html_radios id="status" name='status' values=$status_ids output=$status_names selected=$content.status separator=''}
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="ordinal">Ordinal</label>
		<div class="controls">
			<input class="input input-xxlarge" id="ordinal" name="ordinal" type="text" value="{$content.ordinal}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" > </label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>

</form>