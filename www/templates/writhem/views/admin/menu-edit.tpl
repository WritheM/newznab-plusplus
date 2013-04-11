<div class="page-header">
	<h2>{if $page->title ==''}Add Menu Item{else}{$page->title}{/if}</h2>
</div>

<form class="form-horizontal" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<div class="control-group">
		<label class="control-label" for="title">Title</label>
		<div class="controls">
			<input type="hidden" name="id" value="{$menu.ID}" />
			<input class="input input-xxlarge" id="title" class="long" name="title" type="text" value="{$menu.title|escape:'htmlall'}" />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="href">Href</label>
		<div class="controls">
			<input class="input input-xxlarge" id="href" class="long" name="href" type="text" value="{$menu.href|escape:'htmlall'}" />
			<span class="help-block">Use full <code>http://</code> path for external URLs, otherwise use no prefix.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="tooltip">Tooltip</label>
		<div class="controls">
			<input class="input input-xxlarge" id="tooltip" class="long" name="tooltip" type="text" value="{$menu.tooltip|escape:'htmlall'}" />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="menueval">Evaluate</label>
		<div class="controls">
			<input class="input input-xxlarge" id="menueval" class="long" name="menueval" type="text" value="{$menu.menueval|escape:'htmlall'}" />
			<span class="help-block">Smarty expression returning -1 if the menu item should be disabled.</span>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="role">Role</label>
		<div class="controls">
			{html_radios id="role" name='role' values=$role_ids output=$role_names selected=$menu.role separator=''}
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="ordinal">Ordinal</label>
		<div class="controls">
			<input class="input input-xxlarge" id="ordinal" class="short" name="ordinal" type="text" value="{$menu.ordinal}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="newwindow">New Window</label>
		<div class="controls">
			{html_radios id="newwindow" name='newwindow' values=$yesno_ids output=$yesno_names selected=$menu.newwindow separator=''}
			<span class="help-block">Whether the menu item should open in a new window.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" > </label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>

</form>