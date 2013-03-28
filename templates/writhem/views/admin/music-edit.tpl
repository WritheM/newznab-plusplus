<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<form class="form-horizontal" enctype="multipart/form-data" action="{$SCRIPT_NAME}?action=submit" method="post">

	<input type="hidden" name="id" value="{$music.ID}" />

	<div class="control-group">
		<label class="control-label" for="title">Title</label>
		<div class="controls">
			<input class="input input-xxlarge" id="title" class="long" name="title" type="text" value="{$music.title|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="asin">ASIN</label>
		<div class="controls">
			<input class="input input-xxlarge" id="asin" name="asin" type="text" value="{$music.asin|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="url">URL</label>
		<div class="controls">
			<input class="input input-xxlarge" id="url" class="long" name="url" type="text" value="{$music.url|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="salesrank">Sales Rank</label>
		<div class="controls">
			<input class="input input-xxlarge" id="salesrank" class="short" type="text" name="salesrank" value="{$music.salesrank|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="artist">Artist</label>
		<div class="controls">
			<input class="input input-xxlarge" id="artist" class="long" name="artist" type="text" value="{$music.artist|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="publisher">Publisher</label>
		<div class="controls">
			<input class="input input-xxlarge" id="publisher" class="long" name="publisher" type="text" value="{$music.publisher|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="releasedate">Release Date</label>
		<div class="controls">
			<input class="input input-xxlarge" id="releasedate" name="releasedate" type="text" value="{$music.releasedate|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="year">Year</label>
		<div class="controls">
			<input class="input input-xxlarge" id="year" class="short" name="year" type="text" value="{$music.year|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="genre">Genre</label>
		<div class="controls">
			<select id="genre" name="genre" class="input input-xxlarge">
				{foreach from=$genres item=gen}
				<option {if $gen.ID == $music.genreID}selected="selected"{/if} value="{$gen.ID}">{$gen.title|escape:'htmlall'}</option>
				{/foreach}
			</select>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="tracks">Tracks</label>
		<div class="controls">
			<textarea class="input input-xxlarge" cols="100" rows="3" id="tracks" name="tracks">{$music.tracks|escape:'htmlall'}</textarea>
			<span class="help-block">Tracks separated by | (pipe) delimeter</span>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="cover">Cover Image</label>
		<div class="controls">
			<input type="file" id="cover" name="cover" />
			{if $music.cover == 1}
			<img class="img img-polaroid" style="max-width:200px; display:block;" src="{$smarty.const.WWW_TOP}/../covers/music/{$music.ID}.jpg" alt="" />
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