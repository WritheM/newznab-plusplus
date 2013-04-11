<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<a class="btn btn-small" href="?action=update&id={$rage.ID}">Update from TV Rage</a>

<br/><br/><br/>

<form class="form-horizontal" enctype="multipart/form-data" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<input type="hidden" name="from" value="{$smarty.get.from}" />

	<div class="control-group">
		<label class="control-label" for="rageID">Rage Id</label>
		<div class="controls">
			<input type="hidden" name="id" value="{$rage.ID}" />
			<input class="input input-xxlarge" id="rageID" class="short" name="rageID" type="text" value="{$rage.rageID}" />
			<span class="help-block">The numeric TVRage Id.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="releasetitle">Show Name</label>
		<div class="controls">
			<input class="input input-xxlarge" id="releasetitle" class="long" name="releasetitle" type="text" value="{$rage.releasetitle|escape:'htmlall'}" />
			<span class="help-block">The title of the TV show.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="description">Description</label>
		<div class="controls">
			<textarea cols="100" rows="3" class="input input-xxlarge" id="description" name="description">{$rage.description|escape:'htmlall'}</textarea>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="genre">Show Genres</label>
		<div class="controls">
			<input class="input input-xxlarge" id="genre" class="long" name="genre" type="text" value="{$rage.genre|escape:'htmlall'}" />
			<span class="help-block">The genres for the TV show. Separated by pipes ( | )</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="country">Show Country</label>
		<div class="controls">
			<input class="input input-xxlarge" id="country" name="country" type="text" value="{$rage.country|escape:'htmlall'}" maxlength="2" />
			<span class="help-block">The country for the TV show.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="imagedata">Series Image</label>
		<div class="controls">
			{if $rage.imgdata != ""}
			<img class="img img-polaroid" style="max-width:200px; display:block;" src="{$smarty.const.WWW_TOP}/../getimage?type=tvrage&id={$rage.ID}">
			{/if}
			<input class="input input-xxlarge" type="file" id="imagedata" name="imagedata">
			<span class="help-block">Shown in the TV series view page.</span>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" ></label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
			&nbsp;
			<input class="btn btn-danger" onclick="doDelete(); return false;" type="button" value="Delete" />
		</div>
	</div>

</form>

<script>
function doDelete()
{
	if (confirm('Are you sure?'))
	{
		window.location = "rage-delete.php?id={$rage.ID}&from={$smarty.get.from}";
	}
}
</script>