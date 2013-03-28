<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $serieslist}

<div class="navbar-inner">
        <table width="100%" style="margin-top: 4px;">
                <tr>
                        <td width="30%">
                                <div class="pull-left">
                                        <form class="form-inline" name="thetvdbsearch" action="" method="get" style="margin:0;">
                                                <div class="input-append">
                                                <input class="input input-large" id="seriesname" type="text" name="series" value="{$seriesname}" placeholder="Series Name" />
                                                <input class="btn btn-success" type="submit" value="Search" />
                                                </div>
                                        </form>
                                </div>


                        </td>
                        <td width="70%">
                                {$pager}
                        </td>
                </tr>
        </table>
</div>
<br/>
<table class="data Sortable highlight table table-striped">

	<tr>
		<th style="width:90px;">TheTVDB ID</th>
		<th>Title</th>
		<th style="width:120px;" class="right">Options</th>
	</tr>

	{foreach from=$serieslist item=thetvdb}
	<tr class="{cycle values=",alt"}">
		<td class="less"><a href="{$site->dereferrer_link}http://thetvdb.com/?tab=series&id={$thetvdb.tvdbID}" title="View in TheTVDB">{$thetvdb.tvdbID}</a></td>
		<td><a title="Edit" href="{$smarty.const.WWW_TOP}/thetvdb-edit.php?id={$thetvdb.tvdbID}">{$thetvdb.seriesname|escape:"htmlall"}</a></td>
		<td class="right">
			<div class="btn-group">
				<a class="btn btn-mini btn-warning" title="Delete this TheTVDB entry" href="{$smarty.const.WWW_TOP}/thetvdb-delete.php?id={$thetvdb.tvdbID}">Delete</a>
				<a class="btn btn-mini btn-danger" title="Remove this tvdbID from all releases" href="{$smarty.const.WWW_TOP}/thetvdb-remove.php?id={$thetvdb.tvdbID}">Remove</a>
			</div>
		</td>
	</tr>
	{/foreach}

</table>

<div class="well well-small pagination pagination-small pagination-centered"> {$pager} </div>

{else}

<div class="alert">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<h4>Sorry!</h4>
	No TheTVDB episodes available.
</div>
{/if}
