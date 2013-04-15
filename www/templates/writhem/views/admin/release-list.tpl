<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $releaselist}
	<div class="well well-small pagination pagination-small pagination-centered"> {$pager} </div>
	<table class="data Sortable highlight table table-striped">

		<tr>
			<th style="padding-top:0px; padding-bottom:0px;">name
                        	<a title="Sort Descending" href="{$orderbytitle_desc}">
                                	<i class="fa-icon-caret-down"></i>
                        	</a>
	                        <a title="Sort Ascending" href="{$orderbytitle_asc}">
	                                <i class="fa-icon-caret-up"></i>
	                	</a>
			</th>
			<th style="padding-top:0px; padding-bottom:0px;">category
	                        <a title="Sort Descending" href="{$orderbytitle_desc}">
	                                <i class="fa-icon-caret-down"></i>
	                        </a>
	                        <a title="Sort Ascending" href="{$orderbytitle_asc}">
	                                <i class="fa-icon-caret-up"></i>
	                        </a>
			</th>
			<th style="padding-top:0px; padding-bottom:0px;">size
	                        <a title="Sort Descending" href="{$orderbytitle_desc}">
	                                <i class="fa-icon-caret-down"></i>
	                        </a>
	                        <a title="Sort Ascending" href="{$orderbytitle_asc}">
	                                <i class="fa-icon-caret-up"></i>
	                        </a>
			</th>
			<th style="padding-top:0px; padding-bottom:0px;">files
	                        <a title="Sort Descending" href="{$orderbytitle_desc}">
	                                <i class="fa-icon-caret-down"></i>
	                        </a>
	                        <a title="Sort Ascending" href="{$orderbytitle_asc}">
	                                <i class="fa-icon-caret-up"></i>
	                        </a>
			</th>
			<th style="padding-top:0px; padding-bottom:0px;">posted
	                        <a title="Sort Descending" href="{$orderbytitle_desc}">
	                                <i class="fa-icon-caret-down"></i>
	                        </a>
	                        <a title="Sort Ascending" href="{$orderbytitle_asc}">
	                                <i class="fa-icon-caret-up"></i>
	                        </a>
			</th>
			<th style="padding-top:0px; padding-bottom:0px;">added
	                        <a title="Sort Descending" href="{$orderbytitle_desc}">
	                                <i class="fa-icon-caret-down"></i>
	                        </a>
	                        <a title="Sort Ascending" href="{$orderbytitle_asc}">
	                                <i class="fa-icon-caret-up"></i>
	                        </a>
			</th>
			<th style="padding-top:0px; padding-bottom:0px;">grabs
	                        <a title="Sort Descending" href="{$orderbytitle_desc}">
	                                <i class="fa-icon-caret-down"></i>
	                        </a>
	                        <a title="Sort Ascending" href="{$orderbytitle_asc}">
	                                <i class="fa-icon-caret-up"></i>
	                        </a>
			</th>
			<th style="padding-top:0px; padding-bottom:0px;">options
	                        <a title="Sort Descending" href="{$orderbytitle_desc}">
	                                <i class="fa-icon-caret-down"></i>
	                        </a>
	                        <a title="Sort Ascending" href="{$orderbytitle_asc}">
	                                <i class="fa-icon-caret-up"></i>
	                        </a>
			</th>
		</tr>
	
		{foreach from=$releaselist item=release}
		<tr class="{cycle values=",alt"}">
			<td title="{$release.name}"><a href="{$smarty.const.WWW_TOP}/release-edit.php?id={$release.ID}">{$release.searchname|escape:"htmlall"|wordwrap:75:"\n":true}</a></td>
			<td class="less">{$release.category_name}</td>
			<td class="less">{$release.size|fsize_format:"MB"}</td>
			<td class="less" style="width:50px;"><a href="release-files.php?id={$release.guid}">{$release.totalpart} <i class="fa-icon-file"></i></a></td>
			<td class="less">{$release.postdate|date_format}</td>
			<td class="less">{$release.adddate|date_format}</td>
			<td class="less">{$release.grabs} <i class="icon-download-alt"></td>
			<td><a class="btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/release-delete.php?id={$release.ID}">Delete</a></td>
		</tr>
		{/foreach}

	</table>
{else}
	<div class="alert">
        	<button type="button" class="close" data-dismiss="alert">&times;</button>
     		<h4>Sorry!</h4> 
		No releases available.
	</div>
{/if}
