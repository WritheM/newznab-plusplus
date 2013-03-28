<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<form class="form-horizontal" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<div class="control-group">
		<label class="control-label" for="role">Name</label>
		<div class="controls">
			<input type="hidden" name="id" value="{$role.ID}" />
			{if $role.ID != '' && $role.ID < 4}
			{$role.name}<input id="role" type="hidden" name="name" value="{$role.name}" />
			{else}<input class="input input-xxlarge" id="role" name="name" type="text" value="{$role.name}" />
			<span class="help-block">The name of the role</span>
			{/if}
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="apirequests">Api Requests</label>
		<div class="controls">
			<input class="input input-xxlarge" id="apirequests" name="apirequests" type="text" value="{$role.apirequests}" />
			<span class="help-block">Number of api requests allowed per 24 hour period</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="downloadrequests">Download Requests</label>
		<div class="controls">
			<input class="input input-xxlarge" id="downloadrequests" name="downloadrequests" type="text" value="{$role.downloadrequests}" />
			<span class="help-block">Number of downloads allowed per 24 hour period</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="defaultinvites">Invites</label>
		<div class="controls">
			<input class="input input-xxlarge" id="defaultinvites" name="defaultinvites" type="text" value="{$role.defaultinvites}" />
			<span class="help-block">Default number of invites to give users on account creation</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="canpreview">Can Preview</label>
		<div class="controls">
			{html_radios id="canpreview" name='canpreview' values=$yesno_ids output=$yesno_names selected=$role.canpreview separator=''}
			<span class="help-block">Whether the role can preview screenshots</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="canpre">Can Pre</label>
		<div class="controls">
			{html_radios id="canpre" name='canpre' values=$yesno_ids output=$yesno_names selected=$role.canpre separator=''}
			<span class="help-block">Whether the role can view pre data</span>
		</div>
	</div>
	

{if $role.ID != ''}
	<div class="control-group">
		<label class="control-label" for="role">Is Default Role</label>
		<div class="controls">
			{html_radios id="role" name='isdefault' values=$yesno_ids output=$yesno_names selected=$role.isdefault separator='<br />'}
			<span class="help-block">Make this the default role for new users</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="sele">Excluded Categories</label>
		<div class="controls">
			{html_options class="input input-xxlarge" id="sele" style="height:105px;" multiple=multiple name="exccat[]" options=$catlist selected=$roleexccat}
			<span class="help-block">Use Ctrl and click to exclude multiple categories. This will prevent users with this role from <br/>seeing these categories in the menu or search results.</span>
		</div>
	</div>

{/if}

	<div class="control-group">
		<label class="control-label"></label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>

</form>