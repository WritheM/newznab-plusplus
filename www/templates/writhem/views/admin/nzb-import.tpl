<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<p>
	Import nzbs from a folder or via the browser into the system. Specify the full file path to a folder containing nzbs. Importing will enter the nzbs into the binaries/parts tables, but not create any releases. The <code>update_releases</code> function should be run to create new releases from the imported nzbs.
</p>

<ul>
	<li>If you are importing a large number of nzb files, run this script from the command line and pass in the folder path as the first argument.</li>
	<li>If you are running this script from the command line you can pass <code>true</code>as the second argument to use the nzb filename as the release name.</li>
	<li>If importing a large number of nzb's, running <code>update_releases</code> frequently to ensure your database does not swell.</li>
	<li>Groups contained in the nzbs should be added to the site before the import is run, they do not have to be active.</li>
	<li>If imported sucessfully the nzb will be deleted.</li>
</ul>

<fieldset>
	<legend>Import From Directory</legend>

	<form class="form-horizontal" action="{$SCRIPT_NAME}#results" method="POST">

		<div class="control-group">
			<label class="control-label" for="folder">Folder</label>
			<div class="controls">
				<input id="folder" class="long" name="folder" type="text" value="" />
				<span class="help-block">Windows file paths should be specified with forward slashes e.g. <code>c:/temp/</code></span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="usefilename">Use Filename</label>
			<div class="controls">
				<input class="input input-xlarge" type="checkbox" name="usefilename" />
				<span class="help-block">Use the nzb's filename as the release name. This will bypass the release regex process.</span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label"></label>
			<div class="controls">
				<input class="btn btn-success" type="submit" value="Import" />&nbsp;&nbsp;&nbsp;<b>Once imported the nzb will be deleted.</b>
			</div>
		</div>
	</form>
</fieldset>



<fieldset>
	<legend>Import From Browser</legend>

	<form class="form-horizontal" action="{$SCRIPT_NAME}#results" method="POST" enctype="multipart/form-data">

		<div class="control-group">
			<label class="control-label" for="uploadedfiles[]">File</label>
			<div class="controls">
				<input name="uploadedfiles[]" type="file" class="multi accept-nzb"/>
				<span class="help-block">Select one or more <code>.nzb</code> files.</span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="usefilename">Use Filename</label>
			<div class="controls">
				<input type="checkbox" name="usefilename" />
				<span class="help-block">Use the nzb's filename as the release name. This will bypass the release regex process.</span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label"></label>
			<div class="controls">
				<input class="btn btn-success" type="submit" value="Import" />
			</div>
		</div>

	</form>

</fieldset>


{if $output != ""}
<fieldset>
	<legend>Import Results</legend>
	{$output}
</div>
{/if}

<br/><br/>