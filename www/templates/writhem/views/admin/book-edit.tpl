<div class="page-header">
	<h2>{$page->title}</h2>
</div>
<form class="form-horizontal" enctype="multipart/form-data" action="{$SCRIPT_NAME}?action=submit" method="post">

	<input type="hidden" name="id" value="{$book.ID}" />

	<div class="control-group">
		<label class="control-label" for="title">Title</label>
		<div class="controls">
			<input class="input input-xxlarge" id="title" class="long" name="title" type="text" value="{$book.title|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="asin">ASIN</label> 
		<div class="controls">
			<input class="input input-xxlarge" id="asin" name="asin" type="text" value="{$book.asin|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="url">URL</label>
		<div class="controls">
			<input class="input input-xxlarge" id="url" class="long" name="url" type="text" value="{$book.url|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="author">Author</label>
		<div class="controls">
			<input class="input input-xxlarge" id="author" class="long" name="author" type="text" value="{$book.author|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="publisher">Publisher</label>
		<div class="controls">
			<input class="input input-xxlarge" id="publisher" class="long" name="publisher" type="text" value="{$book.publisher|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="publishdate">Published Date</label>
		<div class="controls">
			<input class="input input-xxlarge" id="publishdate" name="publishdate" type="text" value="{$book.publishdate|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="cover">Cover Image</label>
		<div class="controls">
			<input type="file" id="cover" name="cover" />
			{if $book.cover == 1}
			<img class="img img-polaroid" style="max-width:200px; display:block;" src="{$smarty.const.WWW_TOP}/../covers/book/{$book.ID}.jpg" alt="" />
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