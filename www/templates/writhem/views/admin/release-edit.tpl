<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<form class="form-horizontal" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<input type="hidden" name="from" value="{$smarty.get.from}" />

	<div class="control-group">
		<label class="control-label" for="name">Original Name</label>
		<div class="controls">
			<input type="hidden" name="id" value="{$release.ID}" />
			<input class="input input-xxlarge" id="name" class="long" name="name" type="text" value="{$release.name|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="searchname">Search Name</label>
		<div class="controls">
			<input class="input input-xxlarge" id="searchname" class="long" name="searchname" type="text" value="{$release.searchname|escape:'htmlall'}" />
		</div>
	</div>
{if $updatename != ""}
	<div class="control-group">
		<label class="control-label"></label>
		<div class="controls">
			<input class="input input-xxlarge" onclick="document.getElementById('searchname').value='{$updatename|escape:javascript}'; document.getElementById('name').value='{$updatename|escape:javascript}';return false;" type="button" value="Update Name to {$updatename|escape:'htmlall'}"/>
		</div>
	</div>
{/if}

	<div class="control-group">
		<label class="control-label" for="fromname">From Name</label>
		<div class="controls">
			<input class="input input-xxlarge" id="fromname" class="long" name="fromname" type="text" value="{$release.fromname|escape:'htmlall'}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="category">Category</label>
		<div class="controls">
			{html_options class="input input-xxlarge" id="category" name=category options=$catlist selected=$release.categoryID}
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="totalpart">Parts</label>
		<div class="controls">
			<input class="input input-xxlarge" id="totalpart" class="short" name="totalpart" type="text" value="{$release.totalpart}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="grabs">Grabs</label>
		<div class="controls">
			<input class="input input-xxlarge" id="grabs" class="short" name="grabs" type="text" value="{$release.grabs}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="rageID">Tv Rage Id</label>
		<div class="controls">
			<input class="input input-xxlarge" id="rageID" class="short" name="rageID" type="text" value="{$release.rageID}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="tvdbID">TheTVDB Id</label>
		<div class="controls">
			<input class="input input-xxlarge" id="tvdbID" class="short" name="tvdbID" type="text" value="{$release.tvdbID}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="anidbID">AniDB Id</label>
		<div class="controls">
			<input class="input input-xxlarge" id="anidbID" class="short" name="anidbID" type="text" value="{$release.anidbID}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="seriesfull">Series Full</label>
		<div class="controls">
			<input class="input input-xxlarge" id="seriesfull" class="long" name="seriesfull" type="text" value="{$release.seriesfull}" />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="season">Season</label>
		<div class="controls">
			<input class="input input-xxlarge" id="season" class="short" name="season" type="text" value="{$release.season}" />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="episode">Episode</label>
		<div class="controls">
			<input class="input input-xxlarge" id="episode" class="short" name="episode" type="text" value="{$release.episode}" />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="imdbID">IMDB Id</label>
		<div class="controls">
			<input class="input input-xxlarge" id="imdbID" class="long" name="imdbID" type="text" value="{$release.imdbID}" />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="consoleinfoID">Console Id</label>
		<div class="controls">
			<input class="input input-xxlarge" id="consoleinfoID" class="short" name="consoleinfoID" type="text" value="{$release.consoleinfoID}" />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="group_name" >Group</label>
		<div class="controls">
			<div id="group_name">
			{$release.group_name}
			</div>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="regexID">Regex ID</label> 
		<div class="controls">
			<div id="regexID">
			{$release.regexID}
			</div>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="size">Size</label>
		<div class="controls">
			<input class="input input-xxlarge" id="size" class="long" name="size" type="text" value="{$release.size}" />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="postdate">Posted Date</label>
		<div class="controls">
			<input class="input input-xxlarge" id="postdate" class="long" name="postdate" type="text" value="{$release.postdate}" />
		</td>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="adddate">Added Date</label>
		<div class="controls">
			<input class="input input-xxlarge" id="adddate" class="long" name="adddate" type="text" value="{$release.adddate}" />
		</td>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label"></label> 
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>

</form>