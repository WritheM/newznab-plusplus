<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<form class="form-horizontal" enctype="multipart/form-data" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<input type="hidden" name="from" value="{$smarty.get.from}" />

	<div class="control-group">
		<label class="control-label" for="description">Name</label>
		<div class="controls">
			<input type="hidden" name="id" value="{$source.ID}" />
			<input class="input input-xxlarge" name="description" type="text" value="{$source.description}" />
			<span class="help-block">A name or description for the source.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="username">Poster Username</label>
		<div class="controls">
			<input class="input input-xxlarge" name="username" type="text" value="{$source.username}" />
			<span class="help-block">The username part of the poster. eg nntp</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="useremail">Poster E-mail</label>
		<div class="controls">
			<input class="input input-xxlarge" name="useremail" type="text" value="{$source.useremail}" />
			<span class="help-block">The email part of the poster. eg spot@nntp.com</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="usenetgroup">Usenet Group</label>
		<div class="controls">
			<input name="usenetgroup" type="text" value="{$source.usenetgroup}" />
			<span class="help-block">Group to search when looking up posts for this source.</span>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="publickey">Public Key</label>
		<div class="controls">
			<textarea cols="100" rows="3" class="input input-xxlarge" name="publickey">{$source.publickey|escape:html}</textarea>
			<span class="help-block">Public Key needed to decode the posts specific for this source.</span>
		</div>
	</div>


	<div class="control-group">
		<label class="control-label" ></label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
      <a href="{$smarty.const.WWW_TOP}/spotnab-list.php?id={$source.ID}&toggle={if $source.active=="1"}0" class="btn btn-warning"{else}1" class="btn btn-success"{/if} >{if $source.active=="1"}Deactivate{else}Activate{/if}</a>
		</div>
	</div>

</form>
