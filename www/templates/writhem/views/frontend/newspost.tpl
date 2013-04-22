
<h1><a href="{$smarty.const.WWW_TOP}/news">News</a></h1>

{if $site->adbrowse != ""}
<table class="adblock" cellspacing="0" cellpadding="0"><tr><td>{$site->adbrowse}</td></tr></table><br />
{/if}

{if $results|@count > 0}

<h2>{$results[0].subject|escape:"htmlall"}</h2>

<a id="top"></a>
<table style="width:100%;" class="table table-striped" id="forumtable">
	<tr>
		<th>By</th>
		<th>
			Message
			<div style="float:right;"><a class="btn btn-mini" href="#reply">Reply</a></div>
		</th>
	</tr>

	{foreach from=$results item=result name=result}
		<tr class="{cycle values=",alt"}">
			<td width="15%;">
				{if $result.isadmin}<i class="icon-font" title="{$result|print_r}"></i>
				{elseif $result.isdonator}<i class="icon-certificate" title="User has Donated"></i>
				{else}<i class="icon-user" title="Normal User"></i>
				{/if}
				{if $result.isadmin}<strong>{/if}
				<a {if $smarty.foreach.result.last}id="last"{/if} title="{if $result.isadmin == 1}Admin{else}View profile{/if}" href="{$smarty.const.WWW_TOP}/profile/?name={$result.username}">{$result.username}</a>

				{if $result.isadmin}</strong>{/if}
				<br/>
				on <span title="{$result.createddate}">{$result.createddate|date_format}</span> <div class="hint">({$result.createddate|timeago})</div>
				{if $userdata.role}
				<div>
					<a class="btn btn-mini btn-inverse confirm_action" href="{$smarty.const.WWW_TOP}/admin/forum-delete.php?id={$result.ID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Delete Post">Delete</a>
				</div>
				{/if}
				
			</td>
			<td>{$result.message|escape:"htmlall"|nl2br|magicurl}</td>
		</tr>
	{/foreach}
	
</table>
<table width="100%">
	<tr>
		<td>{$pager}</td>
		<td style="text-align:right">
			<div class="btn-group"style="float:right;margin-top:5px;">
			  <a class="btn btn-mini" href="#reply">Reply</a>
				<a class="btn btn-mini" href="#top">Top</a>
			</div>
		</td>
	</tr>
</table>

<div style="margin-top:10px;">
<h3>Add Reply</h3>
<a id="reply"></a>
<form action="" method="post">
	<label for="addReply">Message:</label><br/>
	<textarea maxlength="5000" id="addReply" name="addReply" rows="6" cols="130" style="width:725px;"></textarea>
	<br/>
	<input class="btn forumreplysubmit" type="submit" value="Save"/>
</form>
</div>

{/if}

