<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<div class="alert alert-block">
	<h4>NB!</h4>
	Below is a list of all usenet groups available to be indexed. Click 'Activate' to enable a group to be indexed.<br/>
	&bull; <strong>Reset</strong> will update the last indexed date of the group so it will appear as the first time you have ever activated that group.<br/>
	&bull; <strong>Delete</strong> will delete the group but leave all releases.<br/>
	&bull; <strong>Purge</strong> will delete all releases for the group.<br/>
	&bull; <strong><a href="group-edit.php">Add your own groups</a></strong> - Here is a <a target="_blank" href="http://www.lightningnews.com/grouplist.txt">fairly comprehensive list of newsgroups</a>.<br/>
</div>


<script language='JavaScript'>
function getURLParameter(name) {
    return decodeURI(
        (RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]
    );
}
</script>

<br/>
<div class="well">
		<form method="get" name="groupsearch" class="navbar-form">
			<div>
				<h5>Filter </h5>
			</div>
			<div style="margin-left:100px; margin-top:-40px;">
			{html_radios id="active" name='active' values=$active_ids output=$active_names selected=$active separator=''}
			</div>
			<div class="input-append" style="margin-left:200px; margin-top:-40px;">
				<input id="groupname" class="input-xlarge" name="groupname" value="{$groupname}" type="text" placeholder="Search text">
				<input id="search_search_button" class="btn btn-success" type="submit" value="Go">
			</div>
				<div class="pull-right" style="margin-top:-33px;">
					<script language='JavaScript'>
					if(getURLParameter('active') == 0){
						document.write('<a class="btn btn-small btn-success" href="{$smarty.const.WWW_TOP}/group-list.php?active=1">Active</a>');
					}
					else{
						document.write('<a class="btn btn-small btn-info" href="{$smarty.const.WWW_TOP}/group-list.php?active=0">All</a>');
					}
				</script>
				</div>
			
		</form>
</div>

{if $grouplist}

<div class="pagination pagination-centered">
{$pager}
</div>

<div id="message" class="alert alert-info" style="display: none;"></div>
<table class="data highlight table table-striped">

	<tr>
		<th>group</th>
		<th>First Post</th>
		<th>Last Post</th>
		<th>last updated</th>
		<th>active</th>
		<th>releases</th>
		<th>Min Files</th>
		<th>Min Size</th>
		<th>Backfill Days</th>
		<th>options</th>
	</tr>

	{foreach from=$grouplist item=group}
	<tr id="grouprow-{$group.ID}" class="{cycle values=",alt"}">
		<td>
			<a href="{$smarty.const.WWW_TOP}/group-edit.php?id={$group.ID}">{$group.name|replace:"alt.binaries":"a.b"}</a>
			<div class="hint">{$group.description}</div>
		</td>
		<td class="less">{$group.first_record_postdate|timeago}</td>
		<td class="less">{$group.last_record_postdate|timeago}</td>
		<td class="less">{$group.last_updated|timeago} ago</td>
		<td class="less" id="group-{$group.ID}">
			{if $group.active=="1"}
				<a href="javascript:ajax_group_status({$group.ID}, 0)" class="group_active btn btn-mini btn-danger">Deactivate</a>
			{else}
				<a href="javascript:ajax_group_status({$group.ID}, 1)" class="group_deactive btn btn-mini btn-success">Activate</a>
			{/if}
		</td>
		<td class="less"><a href="{$smarty.const.WWW_TOP}/../browse?g={$group.name}">{$group.num_releases}</a></td>
		<td class="less">{if $group.minfilestoformrelease==""}n/a{else}{$group.minfilestoformrelease}{/if}</td>
		<td class="less">{if $group.minsizetoformrelease==""}n/a{else}{$group.minsizetoformrelease|fsize_format:"MB"}{/if}</td>
		<td class="less">{$group.backfill_target}</td>
		<td class="less" id="groupdel-{$group.ID}">
			<div class="btn-group">
			<a title="Reset this group" href="javascript:ajax_group_reset({$group.ID})" class="group_reset btn btn-mini btn-warning">Res</a>
			<a href="javascript:ajax_group_delete({$group.ID})" class="group_delete confirm_action btn btn-mini btn-danger">Del</a>
			<a href="javascript:ajax_group_purge({$group.ID})" class="group_purge btn btn-mini" onclick="return confirm('Are you sure? This will delete all releases, binaries/parts in the selected group');" >Pur</a>
			</div>
		</td>
	</tr>
	{/foreach}

</table>
{else}
<p>No groups available (eg. none have been added).</p>
{/if}


