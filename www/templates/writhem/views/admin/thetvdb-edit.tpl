<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<form class="form-horizontal" enctype="multipart/form-data" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<input type="hidden" name="from" value="{$smarty.get.from}" />

	<div class="control-group">
		<label class="control-label" for="tvdbID">tvdbID</label>
		<div class="controls">
			<input class="input input-xxlarge" id="tvdbID" class="long" name="tvdbID" type="text" value="{$series.tvdbID|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="actors">actors</label>
		<div class="controls">
			<input class="input input-xxlarge" id="actors" class="long" name="actors" type="text" value="{$series.actors|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="airsday">airsday</label>
		<div class="controls">
			<input class="input input-xxlarge" id="airsday" class="long" name="airsday" type="text" value="{$series.airsday|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="airstime">airstime</label>
		<div class="controls">
			<input class="input input-xxlarge" id="airstime" class="long" name="airstime" type="text" value="{$series.airstime|escape:'htmlall'}" />
		</td>
	</div>

	<div class="control-group">
		<label class="control-label" for="contentrating">contentrating</label>
		<div class="controls">
			<input class="input input-xxlarge" id="contentrating" class="long" name="contentrating" type="text" value="{$series.contentrating|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="firstaired">firstaired</label>
		<div class="controls">
			<input class="input input-xxlarge" id="firstaired" class="long" name="firstaired" type="text" value="{$series.firstaired|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="genre">genre</label>
		<div class="controls">
			<input class="input input-xxlarge" id="genre" class="long" name="genre" type="text" value="{$series.genre|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="imdbID">imdbID</label>
		<div class="controls">
			<input class="input input-xxlarge" id="imdbID" class="long" name="imdbID" type="text" value="{$series.imdbID|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="network">network</label>
		<div class="controls">
			<input class="input input-xxlarge" id="network" class="long" name="network" type="text" value="{$series.network|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="overview">overview</label>
		<div class="controls">
			<input class="input input-xxlarge" id="overview" class="long" name="overview" type="text" value="{$series.overview|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="rating">rating</label>
		<div class="controls">
			<input class="input input-xxlarge" id="rating" class="long" name="rating" type="text" value="{$series.rating|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="ratingcount">ratingcount</label>
		<div class="controls">
			<input class="input input-xxlarge" id="ratingcount" class="long" name="ratingcount" type="text" value="{$series.ratingcount|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="runtime">runtime</label>
		<div class="controls">
			<input class="input input-xxlarge" id="runtime" class="long" name="runtime" type="text" value="{$series.runtime|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="seriesname">seriesname</label>
		<div class="controls">
			<input class="input input-xxlarge" id="seriesname" class="long" name="seriesname" type="text" value="{$series.seriesname|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="status">status</label>
		<div class="controls">
			<input class="input input-xxlarge" id="status" class="long" name="status" type="text" value="{$series.status|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" ></label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>

</form>