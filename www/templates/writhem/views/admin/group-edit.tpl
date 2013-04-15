<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<form class="form-horizontal" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<div class="control-group">
		<label class="control-label" for="name">Name</label>
		<div class="controls">
			<input type="hidden" name="id" value="{$group.ID}" />
			<input class="input input-xxlarge" id="name" class="long" name="name" type="text" value="{$group.name}" />
			<span class="help-block">Changing the name to an invalid group will break things.</span>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="description">Description</label>
		<div class="controls">
			<textarea cols="100" rows="3" class="input input-xlarge" id="description" name="description">{$group.description}</textarea>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="backfill_target">Backfill Days</label>
		<div class="controls">
			<input class="input input-xxlarge" class="small" id="backfill_target" name="backfill_target" type="text" value="{$group.backfill_target}" />
			<span class="help-block">Number of days to attempt to backfill this group.  Adjust as necessary.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="minfilestoformrelease">Minimum Files <br/>To Form Release</label>
		<div class="controls">
			<input class="input input-xxlarge" class="small" id="minfilestoformrelease" name="minfilestoformrelease" type="text" value="{$group.minfilestoformrelease}" />
			<span class="help-block">The minimum number of files to make a release. i.e. if set to two, then releases which only contain one file will not be created. If left blank, will use the site wide setting.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="minsizetoformrelease">Minimum File Size to Make a Release</label>
		<div class="controls">
			<input class="input input-xxlarge" class="small" id="minsizetoformrelease" name="minsizetoformrelease" type="text" value="{$group.minsizetoformrelease}" />
			<span class="help-block">The minimum total size in bytes to make a release. If left blank, will use the site wide setting.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="active">Active</label>
		<div class="controls">
			{html_radios id="active" name='active' values=$yesno_ids output=$yesno_names selected=$group.active separator=''}
			<span class="help-block">Inactive groups will not have headers downloaded for them.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" > </label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>

</form>
