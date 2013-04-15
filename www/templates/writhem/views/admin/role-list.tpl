<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<table class="data highlight table table-striped">

	<tr>
		<th>name</th>
		<th>request limit</th>
		<th>download limit</th>
		<th>invites</th>
		<th>can preview</th>
		<th>can pre</th>
		<th>default roles</th>
		<th>options</th>
	</tr>

	
	{foreach from=$userroles item=role}
	<tr class="{cycle values=",alt"}">
		<td><a href="{$smarty.const.WWW_TOP}/role-edit.php?id={$role.ID}">{$role.name}</a></td>
		<td>{$role.apirequests}</td>
		<td>{$role.downloadrequests}</td>
		<td>{$role.defaultinvites}</td>
		<td>{if $role.canpreview == 1}Yes{else}No{/if}</td>
		<td>{if $role.canpre == 1}Yes{else}No{/if}</td>
		<td>{if $role.isdefault=="1"}Yes{else}No{/if}</td>
		<td><div class="btn-group">
			<a class="btn btn-mini btn-warning" href="{$smarty.const.WWW_TOP}/role-edit.php?id={$role.ID}">Edit</a>
			{if $role.ID>"3"}
			<a class="confirm_action btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/role-delete.php?id={$role.ID}">Delete</a>
			{/if}
			</div>
		</td>
	</tr>
	{/foreach}


</table>