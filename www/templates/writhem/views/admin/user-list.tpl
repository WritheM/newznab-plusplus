<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<div class="well well-small">
	<form class="navbar-form" name="usersearch" action="">
		<input class="input input-xlarge" id="username" type="text" name="username" value="{$username}" placeholder="Username"/>
		<input class="input input-xlarge" id="email" type="text" name="email" value="{$email}" placeholder="Email"/>
		<input class="input input-large" id="host" type="text" name="host" value="{$host}"  placeholder="Host"/>
		<select class="input input-medium" name="role">
			<option value="">-- any --</option>
			{html_options values=$role_ids output=$role_names selected=$role}
		</select>
		<input class="btn btn-success pull-right" type="submit" value="Search" />
	</form>
</div>

{$pager}

<table class="data highlight table table-striped">

	<tr>
		<th>name<br/>
			<a title="Sort Descending" href="{$orderbyusername_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyusername_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		
		<th>email<br/>
			<a title="Sort Descending" href="{$orderbyemail_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyemail_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		
		<th>host<br/>
			<a title="Sort Descending" href="{$orderbyhost_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyhost_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		<th>join date<br/>
			<a title="Sort Descending" href="{$orderbycreateddate_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbycreateddate_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
			
		<th>last login<br/>
			<a title="Sort Descending" href="{$orderbylastlogin_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbylastlogin_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
				
		<th>api access<br/>
			<a title="Sort Descending" href="{$orderbyapiaccess_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyapiaccess_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
				
		<th class="mid">grabs<br/>
			<a title="Sort Descending" href="{$orderbygrabs_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbygrabs_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
				
		<th class="mid">invites</th>
		
		<th class="mid">notes</th>
		
		<th>role<br/>
			<a title="Sort Descending" href="{$orderbyrole_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyrole_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		
		<th>options</th>
	</tr>

	
	{foreach from=$userlist item=user}
	<tr class="{cycle values=",alt"}">
		<td><a title="Edit user" href="{$smarty.const.WWW_TOP}/user-edit.php?id={$user.ID}">{$user.username}</a></td>
		<td><a title="View profile" href="{$smarty.const.WWW_TOP}/../profile?id={$user.ID}">{$user.email}</a></td>
		<td>{$user.host}</td>
		<td title="{$user.createddate}">{$user.createddate|date_format}</td>
		<td title="{$user.lastlogin}">{$user.lastlogin|date_format}</td>
		<td title="{$user.apiaccess}">{$user.apiaccess|date_format}</td>
		<td class="mid">{$user.grabs}</td>
		<td class="mid">{$user.invites}</td>
		<td class="mid"><a title="{if $user.notes|count_characters > 0}View{else}Add{/if} Notes" href="{$smarty.const.WWW_TOP}/user-edit.php?id={$user.ID}#notes"><img src="{$smarty.const.WWW_TOP}/../templates/default/images/icons/{if $user.notes|count_characters > 0}note_edit.png{else}note_add.png{/if}" alt="" /></a></td>
		<td>{$user.rolename}</td>
		<td>{if $user.role!="2"}<a class="confirm_action btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/user-delete.php?id={$user.ID}">delete</a>{/if}</td>
	</tr>
	{/foreach}


</table>