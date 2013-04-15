<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<form class="form-horizontal" enctype="multipart/form-data" action="{$SCRIPT_NAME}?action=submit" method="post">

	<input type="hidden" name="id" value="{$movie.imdbID}" />

	<div class="control-group">
		<label class="control-label" for="title">IMDB ID</label>
		<div class="controls">
			{$movie.imdbID}
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="title">TMDb ID</label>
		<div class="controls">
			{$movie.tmdbID}
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="title">Title</label>
		<div class="controls">
			<input class="input input-xxlarge" id="title" class="long" name="title" type="text" value="{$movie.title|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="tagline">Tagline</label>
		<div class="controls">
			<input class="input input-xxlarge" id="tagline" class="long" name="tagline" type="text" value="{$movie.tagline|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="plot">Plot</label>
		<div class="controls">
			<textarea class="input input-xxlarge" cols="100" rows="6" id="plot" name="plot">{$movie.plot|escape:'htmlall'}</textarea>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="year">Year</label>
		<div class="controls">
			<input class="input input-xxlarge" id="year" class="short" name="year" type="text" value="{$movie.year|escape:'htmlall'}" />
		</div>
	</div>
 
	<div class="control-group">
		<label class="control-label" for="rating">Rating</label>
		<div class="controls">
			<input class="input input-xxlarge" id="rating" class="short" name="rating" type="text" value="{$movie.rating|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="genre">Genre</label>
		<div class="controls">
			<input class="input input-xxlarge" id="genre" class="long" name="genre" type="text" value="{$movie.genre|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="director">Director</label>
		<div class="controls">
			<input class="input input-xxlarge" id="director" class="long" name="director" type="text" value="{$movie.director|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="actors">Actors</label>
		<div class="controls">
			<textarea class="input input-xxlarge" cols="100" rows="3" id="actors" name="actors">{$movie.actors|escape:'htmlall'}</textarea>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="language">Language</label>
		<div class="controls">
			<input class="input input-xxlarge" id="language" class="long" name="language" type="text" value="{$movie.language|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="cover">Cover Image</label>
		<div class="controls">
			<input type="file" id="cover" name="cover" />
			{if $movie.cover == 1}
				<img class="img img-polaroid" style="max-width:200px; display:block;" src="{$smarty.const.WWW_TOP}/../covers/movies/{$movie.imdbID}-cover.jpg" alt="" />
			{/if}
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="backdrop">Backdrop Image</label>
		<div class="controls">
			<input type="file" name="backdrop" />
			{if $movie.backdrop == 1}
				<img class="img img-polaroid" style="max-width:200px; display:block;" src="{$smarty.const.WWW_TOP}/../covers/movies/{$movie.imdbID}-backdrop.jpg" alt="" />
			{/if}
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" > </label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>

</form>