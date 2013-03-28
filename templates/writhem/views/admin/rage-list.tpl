<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $tvragelist}
<div class="navbar-inner">
        <table width="100%" style="margin-top: 4px;">
                <tr>
                        <td width="30%">
                        	<div class="pull-left">
					<form class="form-inline" name="ragesearch" action="" method="get" style="margin:0;">
                                		<div class="input-append">
                                		<input class="input input-large" id="ragename" type="text" name="ragename" value="{$ragename}" placeholder="Title" />
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
		<th style="width:50px;">rageid</th>
		<th>title</th>
		<th style="width:100px;">date</th>
		<th style="width:100px;" class="right">options</th>
	</tr>
	
	{foreach from=$tvragelist item=tvrage}
	<tr class="{cycle values=",alt"}">
		<td class="less"><a href="http://www.tvrage.com/shows/id-{$tvrage.rageID}" title="View in TvRage">{$tvrage.rageID}</a></td>
		<td><a title="Edit" href="{$smarty.const.WWW_TOP}/rage-edit.php?id={$tvrage.ID}">{$tvrage.releasetitle|escape:"htmlall"}</a></td>
		<td class="less" style="width:80px;">{$tvrage.createddate|date_format}</td>
		<td class="right">
			<div class="btn-group">
				<a class="btn btn-mini btn-warning" title="Delete this rage entry" href="{$smarty.const.WWW_TOP}/rage-delete.php?id={$tvrage.ID}">Delete</a>
				<a class="btn btn-mini btn-danger" title="Remove this rageid from all releases" href="{$smarty.const.WWW_TOP}/rage-remove.php?id={$tvrage.rageID}">Remove</a>
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
	No TVRage episodes available.
</div>

{/if}
