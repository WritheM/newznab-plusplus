<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<p>
	Export nzbs from the system into a folder. Specify the full file path to a folder.
	<br/>
	If you are exporting a large number of nzb files, run this script from the command line and pass in the folder path as the first argument. e.g. php scriptname outputpath from(optional) to(optional) groupid(optional use -1) categoryid(optional)<br/>
	<br/>
	<code>
		php admin/nzb-export.php /path/to/export/into 01/01/2008 01/01/2010 -1 1050
	</code>
	<br/>
</p>


<form class="form-horizontal" action="{$SCRIPT_NAME}" method="POST">

	<div class="control-group">
		<label class="control-label" for="folder">Folder</label>
		<div class="controls">
			<input class="input input-xxlarge" id="folder" class="long" name="folder" type="text" value="{$folder}" />
			<span class="help-block">Windows file paths should be specified with forward slashes e.g. <code>c:/temp/</code></span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="postfrom">Posted Between</label>
		<div class="controls">
			<input class="input input-xxlarge" id="postfrom" class="date" name="postfrom" type="text" value="{$fromdate}" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="postto"> and </label>
		<div class="controls">
			<input class="input input-xxlarge" id="postto" class="date" name="postto" type="text" value="{$todate}" />
			<span class="help-block">Posted to usenet inbetween a date range specified in the format dd/mm/yyyy</span>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="group">Group</label>
		<div class="controls">
			{html_options class="input input-xxlarge" id="group" name='group' options=$grouplist selected=$group}
			<span class="help-block">Posted to this newsgroup</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="categoryID">Category</label>
		<div class="controls">
			{html_options class="input input-xxlarge" id="categoryID" name='categoryID' options=$catlist selected=$cat}
			<span class="help-block">Posted to this category</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label"></label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Export" />
		</div>
	</div>
</form>

<div>
	{$output}
</div>