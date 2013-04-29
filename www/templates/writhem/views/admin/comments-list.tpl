<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $commentslist}
{$pager}

<table class="data Sortable highlight table table-striped">

	<tr>
		<th>user</th>
		<th>date</th>
		<th>comment</th>
		<th>host</th>
		<th>options</th>
	</tr>

	
	{foreach from=$commentslist item=comment}
  
	<tr class="{cycle values=",alt"}">
  <td>
          {if $comment.role == -1}<i class="icon-globe" title="Syndicated User"></i>
            {$comment.username}{if $isadmin} <br />@<a href="{$smarty.const.WWW_TOP}/admin/spotnab-edit.php?id={$comment.sourceid}">{$comment.rolename}</a>{/if}
          {elseif $comment.role == 2}<i class="icon-font" title="{$comment.rolename}"></i>
            <strong><a title="View {$comment.username}'s profile" href="{$smarty.const.WWW_TOP}/user-edit.php?id={$comment.userID}">{$comment.username}</a></strong>
          {elseif $comment.role == 4}<i class="icon-certificate" title="{$comment.rolename}"></i>
            <a title="View {$comment.username}'s profile" href="{$smarty.const.WWW_TOP}/user-edit.php?id={$comment.userID}">{$comment.username}</a>
          {else}<i class="icon-user" title="{$comment.username}"></i>
            <a title="View {$comment.username}'s profile" href="{$smarty.const.WWW_TOP}/user-edit.php?id={$comment.userID}">{$comment.username}</a>
          {/if}
    </td>
		<td title="{$comment.createddate}">{$comment.createddate|date_format}</td>
		<td>{$comment.text|escape:"htmlall"|nl2br}</td>
		<td>{$comment.host}</td>
		<td>
			<div class="btn-group">
				{if $comment.guid != ""}<a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/../details/{$comment.guid}#comments">view</a>
        {else}{$comment|print_r}{writhem_admin_comments id=$comment['ID']}{/if} 
				<a class="btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/comments-delete.php?id={$comment.ID}">delete</a>
			</div>
		</td>
	</tr>
	{/foreach}


</table>

{$pager}
{else}
	<div class="alert">
	    <button type="button" class="close" data-dismiss="alert">&times;</button>
	    <h4>Sorry!</h4>
	        No comments available.
	</div>
{/if}
