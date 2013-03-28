<div class="page-header">
	<h2>{if $page->title != '' }{$page->title}{else}Add User{/if}</h2>
</div>

{if $error != ''}
	<div class="alert alert-error">
		<strong>Error!</strong>
		No menus available.
	</div>
{/if}

<form class="form-horizontal" action="{$SCRIPT_NAME}?action=submit" method="POST">

	<div class="control-group">
		<label class="control-label" for="username">Name</label>
		<div class="controls">
			<input type="hidden" name="id" value="{$user.ID}" />
			<input class="input input-xxlarge" id="username" autocomplete="off" class="long" name="username" type="text" value="{$user.username}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="email">Email</label>
		<div class="controls">
			<input class="input input-xxlarge" id="email" autocomplete="off" class="long" name="email" type="text" value="{$user.email}" />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="password">Password</label>
		<div class="controls">
			<input class="input input-xxlarge" id="password" autocomplete="off" class="long" name="password" type="password" value="" />
			{if $user.ID}
				<span class="help-block">Only enter a password if you want to change it.</span>
			{/if}
			
		</div>
	</div>
	
	{if $user.ID}
	
	<div class="control-group">
		<label class="control-label" for="grabs">Grabs</label>
		<div class="controls">
			<input class="input input-xxlarge" id="grabs" class="short" name="grabs" type="text" value="{$user.grabs}" />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="invites">Invites</label>
		<div class="controls">
			<input class="input input-xxlarge" id="invites" class="short" name="invites" type="text" value="{$user.invites}" />
		</div>
	</div>
	{/if}

	<div class="control-group">
		<label class="control-label" for="movieview">Movie View</label>
		<div class="controls">
			<input id="movieview" name="movieview" type="checkbox" value="1" {if $user.movieview=="1"}checked="checked"{/if} />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="musicview">Music View</label>
		<div class="controls">
			<input id="musicview" name="musicview" type="checkbox" value="1" {if $user.movieview=="1"}checked="checked"{/if} />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="consoleview">Console View</label>
		<div class="controls">
			<input id="consoleview" name="consoleview" type="checkbox" value="1" {if $user.movieview=="1"}checked="checked"{/if} />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="bookview">Book View</label>
		<div class="controls">
			<input id="bookview" name="bookview" type="checkbox" value="1" {if $user.movieview=="1"}checked="checked"{/if} />
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="role">Role</label>
		<div class="controls">
			{html_radios id="role" name='role' values=$role_ids output=$role_names selected=$user.role separator=''}
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="notesview"><a id="notes"></a>Notes</label>
		<div class="controls">
			<textarea class="input input-xxlarge" cols="100" rows="3" id="notesview" maxlength="255" id="notes" name="notes" >{$user.notes|escape:html}</textarea>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label"></label>
		<div class="controls">
			<input class="btn btn-success" type="submit" value="Save" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label"></label>
		<div class="controls">
			{if $user.ID != ""}
				<input class="btn btn-danger" onclick="return doDelete();" type="button" value="Delete" />	

				<script type="text/javascript">
				function doDelete()
				{
					if (confirm('Are you sure?'))  
						window.location='user-delete.php?id={$user.ID}&redir=user-list.php'; 
					else 
						return false;
				}
				</script>
			{/if}
		</div>
	</div>

</form>


