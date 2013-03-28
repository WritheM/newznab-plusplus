<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<form class="form-horizontal" enctype="multipart/form-data" action="{$SCRIPT_NAME}" method="post">

	<div class="control-group">
		<label class="control-label" ></label>
		<div class="controls">
			Enter the full 7 digit IMDB id into the box below and click Add.
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="title">IMDB ID</label>
		<div class="controls">
			<input class="input input-large" id="id" class="long" name="id" type="text" value="" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" ></label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Add" />
		</div>
	</div>

</form>