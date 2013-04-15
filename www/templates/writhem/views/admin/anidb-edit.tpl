<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<form class="form-horizontal" enctype="multipart/form-data" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<input type="hidden" name="from" value="{$smarty.get.from}" />

	<div class="control-group">
		<label class="control-label" for="anidbID">AniDB Id</label>
		<div class="controls">
			<input class="input input-xxlarge" id="anidbID" class="long" name="anidbID" type="text" value="{$anime.anidbID|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="title">Anime Name</label>
		<div class="controls">
			<input class="input input-xxlarge" id="title" class="long" name="title" type="text" value="{$anime.title|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="type">Type</label>
		<div class="controls">
			<input class="input input-xxlarge" id="type" class="long" name="type" type="text" value="{$anime.type|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="startdate">Start date</label>
		<div class="controls">
			<input class="input input-xxlarge" id="startdate" class="long" name="startdate" type="text" value="{$anime.startdate|escape:'htmlall'}" />>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="enddate">End date</label>
		<div class="controls">
			<input class="input input-xxlarge" id="enddate" class="long" name="enddate" type="text" value="{$anime.enddate|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="related">Related</label>
		<div class="controls">
			<input class="input input-xxlarge" id="related" class="long" name="related" type="text" value="{$anime.related|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="creators">Creators</label>
		<div class="controls">
			<input class="input input-xxlarge" id="creators" class="long" name="creators" type="text" value="{$anime.creators|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="description">Description</label>
		<div class="controls">
			<textarea cols="100" rows="5" class="input input-xxlarge" id="description" name="description">{$anime.description|escape:'htmlall'}</textarea>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="rating">Rating</label>
		<div class="controls">
			<input class="input input-xxlarge" id="rating" class="long" name="rating" type="text" value="{$anime.rating|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="categories">Categories</label>
		<div class="controls">
			<input class="input input-xxlarge" id="categories" class="long" name="categories" type="text" value="{$anime.categories|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="characters">Characters</label>
		<div class="controls">
			<input class="input input-xxlarge" id="characters" class="long" name="characters" type="text" value="{$anime.characters|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="epnos">Episode numbers</label>
		<div class="controls">
			<input class="input input-xxlarge" id="epnos" class="long" name="epnos" type="text" value="{$anime.epnos|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="airdates">Episode air dates</label>
		<div class="controls">
			<input class="input input-xxlarge" id="airdates" class="long" name="airdates" type="text" value="{$anime.airdates|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="episodetitles">Episode titles</label>
		<div class="controls">
			<input class="input input-xxlarge" id="episodetitles" class="long" name="episodetitles" type="text" value="{$anime.episodetitles|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" > </label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>

</form>