<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<form class="form-horizontal" enctype="multipart/form-data" action="{$SCRIPT_NAME}?action=submit" method="post">

	<input type="hidden" name="id" value="{$console.ID}" />

	<div class="control-group">
		<label class="control-label" for="title">Title</label>
		<div class="controls">
			<input class="input input-xxlarge" id="title" class="long" name="title" type="text" value="{$console.title|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="asin">ASIN</label>
		<div class="controls">
			<input class="input input-xxlarge" id="asin" name="asin" type="text" value="{$console.asin|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="url">URL</label>
		<div class="controls">
			<input class="input input-xxlarge" id="url" class="long" name="url" type="text" value="{$console.url|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="salesrank">Sales Rank</label>
		<div class="controls">
			<input class="input input-xxlarge" id="salesrank" class="short" type="text" name="salesrank" value="{$console.salesrank|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="platform">Platform</label>
		<div class="controls">
			<input class="input input-xxlarge" id="platform" class="long" name="platform" type="text" value="{$console.platform|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="publisher">Publisher</label>
		<div class="controls">
			<input class="input input-xxlarge" id="publisher" class="long" name="publisher" type="text" value="{$console.publisher|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="releasedate">Release Date</label>
		<div class="controls">
			<input class="input input-xxlarge" id="releasedate" name="releasedate" type="text" value="{$console.releasedate|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="esrb">Rating</label>
		<div class="controls">
			<input class="input input-xxlarge" id="esrb" class="short" name="esrb" type="text" value="{$console.esrb|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="genre">Genre</label>
		<div class="controls">
			<select class="input input-xxlarge" id="genre" name="genre">
				{foreach from=$genres item=gen}
				<option {if $gen.ID == $console.genreID}selected="selected"{/if} value="{$gen.ID}">{$gen.title|escape:'htmlall'}</option>
				{/foreach}
			</select>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="cover">Cover Image</label>
		<div class="controls">
			<input type="file" id="cover" name="cover" />
			{if $console.cover == 1}
			<img style="max-width:200px; display:block;" src="{$smarty.const.WWW_TOP}/../covers/console/{$console.ID}.jpg" alt="" />
			{/if}
		</div>
	</div>

	<div class="control-group">
		<label class="control-label"></label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>

</form>