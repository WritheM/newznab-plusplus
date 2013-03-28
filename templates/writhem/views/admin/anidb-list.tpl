<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $anidblist}

<div class="navbar-inner">
        <table width="100%" style="margin-top: 4px;">
                <tr>
                        <td width="30%">
                                <div class="pull-left">
                                        <form class="form-inline" name="anidbsearch" action="" method="get" style="margin:0;">
                                                <div class="input-append">
                                                <input class="input input-large" id="anidbtitle" type="text" name="anidbtitle" value="{$anidbtitle}" placeholder="Title" />
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
		<th style="width:60px;">AniDB Id</th>
		<th>Title</th>
		<th style="width:120px;" class="right">Options</th>
	</tr>
	
	{foreach from=$anidblist item=anidb}
	<tr class="{cycle values=",alt"}">
		<td class="less"><a href="http://anidb.net/perl-bin/animedb.pl?show=anime&amp;aid={$anidb.anidbID}" title="View in AniDB">{$anidb.anidbID}</a></td>
		<td><a title="Edit" href="{$smarty.const.WWW_TOP}/anidb-edit.php?id={$anidb.anidbID}">{$anidb.title|escape:"htmlall"}</a></td>
		<td class="right">
			<div class="btn-group">
				<a class="btn btn-mini btn-warning" title="Delete this AniDB entry" href="{$smarty.const.WWW_TOP}/anidb-delete.php?id={$anidb.anidbID}">Delete</a>
				<a class="btn btn-mini btn-danger" title="Remove this anidbID from all releases" href="{$smarty.const.WWW_TOP}/anidb-remove.php?id={$anidb.anidbID}">Remove</a>
				</div>
		</td>
	</tr>
	{/foreach}

</table>

<div class="well well-small pagination pagination-small pagination-centered"> {$pager} </div>

{else}
<div class="alert">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Sorry!</strong>
	No AniDB episodes available.
</div>
{/if}
