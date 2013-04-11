<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $error != ''}
	<div class="alert alert-error"><strong>Error!</strong> {$error}</div>
{/if}

<form class="form-horizontal" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<div class="control-group">
		<label class="control-label" for="id">Title</label>
		<div class="controls">
			<input type="hidden" name="id" value="{$category.ID}" />
			{$category.title}
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="id">Parent</label>
		<div class="controls">
			{$category.parentID}
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="desc">Description</label>
		<div class="controls">
			<input class="input input-medium" type="text" id="desc" class="long" name="description" value="{$category.description}" />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="status">Active</label>
		<div class="controls">
			{html_radios id="status" name='status' values=$status_ids output=$status_names selected=$category.status separator=''}
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="disablepreview">Disable Preview</label>
		<div class="controls">
			{html_radios id="disablepreview" name='disablepreview' values=$status_ids output=$status_names selected=$category.disablepreview separator=''}
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" ></label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>


</form>