<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<div class="accordion" id="sitestatus">
	
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#sitestatus" href="#signups">
				Signups
			</a>
		</div>
		<div id="signups" class="accordion-body collapse in" style="height: 0px;">
			<div class="accordion-inner">
				<table class="data highlight table table-striped">
					<tr>
						<th>Month</th>
						<th>Signups</th>
					</tr>

					{foreach from=$usersbymonth item=result}
						{assign var="totusers" value=$totusers+$result.num}
						<tr class="{cycle values=",alt"}">
							<td width="75%">{$result.mth}</td>
							<td>{$result.num}</td>
						</tr>
					{/foreach}
					<tr><td><strong>Total</strong></td><td><strong>{$totusers}</strong></td></tr>
				</table>
				
			</div>
		</div>
	</div>
	
	{if $topgrabs|count > 0}
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#sitestatus" href="#grabbers">
				Top Grabbers
			</a>
		</div>
		<div id="grabbers" class="accordion-body collapse" style="height: auto;">
			<div class="accordion-inner">
				
					<table class="data highlight table table-striped">
						<tr>
							<th>User</th>
							<th>Grabs</th>
						</tr>

						{foreach from=$topgrabs item=result}
							<tr class="{cycle values=",alt"}">
								<td width="75%"><a href="{$smarty.const.WWW_TOP}/user-edit.php?id={$result.ID}">{$result.username}</a></td>
								<td>{$result.grabs}</td>
							</tr>
						{/foreach}
		
					</table>

					<br/>
				
				
			</div>
		</div>
	</div>
	{/if}
	
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#sitestatus" href="#role">
				Users by Role
			</a>
		</div>
		<div id="role" class="accordion-body collapse" style="height: 0px;">
			<div class="accordion-inner">
				<table class="data highlight Sortable table table-striped">
					<tr>
						<th>Role</th>
						<th>Users</th>
					</tr>

					{foreach from=$usersbyrole item=result}
						{assign var="totrusers" value=$totrusers+$result.num}
						<tr class="{cycle values=",alt"}">
							<td width="75%">{$result.name}</td>
							<td>{$result.num}</td>
						</tr>
					{/foreach}
					<tr><td><strong>Total</strong></td><td><strong>{$totrusers}</strong></td></tr>
				</table>
			</div>
		</div>
	</div>
	
	{if $usersbyhosthash|count > 0}
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#sitestatus" href="#hosthash">
				Users by Hosthash
			</a>
		</div>
		<div id="hosthash" class="accordion-body collapse" style="height: 0px;">
			<div class="accordion-inner">
				<table class="data highlight Sortable table table-striped">
					<tr>
						<th>Hosthash</th>
						<th>User IDs (Edit)</th>
						<th>User Names (Profiles)</th>
					</tr>

					{foreach from=$usersbyhosthash item=result}
						<tr class="{cycle values=",alt"}">
		
							<td width="25%">{$result.hosthash}</td>
							<td>
							{assign var="usersplits" value=","|explode:$result.user_string}
							{foreach from=$usersplits item=usersplit}
								<a href="{$smarty.const.WWW_TOP}/user-edit.php?id={$usersplit}">{$usersplit}</a>
							{/foreach}			
							</td>
							<td>
							{assign var="usernsplits" value=","|explode:$result.user_names}
							{foreach from=$usernsplits item=usernsplit}
								<a href="{$smarty.const.WWW_TOP}/../profile?name={$usernsplit}">{$usernsplit}</a>
							{/foreach}			
							</td>
						</tr>
					{/foreach}
				</table>
			</div>
		</div>
	</div>
	{/if}
	
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#sitestatus" href="#date">
				Access by Date
			</a>
		</div>
		<div id="date" class="accordion-body collapse" style="height: 0px;">
			<div class="accordion-inner">
				<table  class="data highlight Sortable table table-striped">
					<tr>
						<th>Type</th>
						<th>Last Day</th>
						<th>2-7 Days</th>
						<th>8-30 Days</th>
						<th>1-3 Months</th>
						<th>3-6 Months</th>
						<th>+6 Months</th>
					</tr>

					{foreach from=$loginsbymonth item=result}
						<tr class="{cycle values=",alt"}">
							<td>{$result.type}</td>
							<td style="width:80px;">{$result.1day}</td>
							<td style="width:80px;">{$result.7day}</td>
							<td style="width:80px;">{$result.1month}</td>
							<td style="width:80px;">{$result.3month}</td>
							<td style="width:80px;">{$result.6month}</td>
							<td style="width:80px;">{$result.12month}</td>
						</tr>
					{/foreach}
				</table>
			</div>
		</div>
	</div>
	
	{if $topdownloads|count > 0}
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#sitestatus" href="#downloads">
				Top Downloads
			</a>
		</div>
		<div id="downloads" class="accordion-body collapse" style="height: 0px;">
			<div class="accordion-inner">
				<table class="data highlight table table-striped">
					<tr>
						<th>Release</th>
						<th>Grabs</th>
						<th>Days Ago</th>
					</tr>

					{foreach from=$topdownloads item=result}
						<tr class="{cycle values=",alt"}">
							<td width="75%"><a href="{$smarty.const.WWW_TOP}/../details/{$result.guid}">{$result.searchname|escape:"htmlall"|replace:".":" "}</a>
							{if $isadmin}<a href="{$smarty.const.WWW_TOP}/release-edit.php?id={$result.ID}">[Edit]</a>{/if}</td>
							<td>{$result.grabs}</td>
							<td>{$result.adddate|timeago}</td>
						</tr>
					{/foreach}
		
				</table>
			</div>
		</div>
	</div>
	{/if}
	
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#sitestatus" href="#week">
				Releases Added In Last 7 Days
			</a>
		</div>
		<div id="week" class="accordion-body collapse" style="height: 0px;">
			<div class="accordion-inner">
				<table class="data highlight table table-striped">
					<tr>
						<th>Category</th>
						<th>Releases</th>
					</tr>

					{foreach from=$recent item=result}
						<tr class="{cycle values=",alt"}">
							<td width="75%">{$result.title}</td>
							<td>{$result.count}</td>
						</tr>
					{/foreach}
	
				</table>
			</div>
		</div>
	</div>
	
	{if $topcomments|count > 0}
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#sitestatus" href="#comments">
				Top Comments
			</a>
		</div>
		<div id="comments" class="accordion-body collapse" style="height: 0px;">
			<div class="accordion-inner">
				<table class="data highlight table table-striped">
					<tr>
						<th>Release</th>
						<th>Comments</th>
						<th>Days Ago</th>
					</tr>

					{foreach from=$topcomments item=result}
						<tr class="{cycle values=",alt"}">
							<td width="75%"><a href="{$smarty.const.WWW_TOP}/../details/{$result.guid}/#comments">{$result.searchname|escape:"htmlall"|replace:".":" "}</a></td>
							<td>{$result.comments}</td>
							<td>{$result.adddate|timeago}</td>
						</tr>
					{/foreach}
		
				</table>
			</div>
		</div>
	</div>
	{/if}
	
</div>

