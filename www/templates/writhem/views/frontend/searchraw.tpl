 
<h1>Search Binaries</h1>

<form method="get" action="{$smarty.const.WWW_TOP}/searchraw">
	<div class="input-append input-prepend" style="text-align:center;">
        <input class="search input" id="search" value="{$search|escape:'html'}" type="text"/>
        <button type="submit" id="searchraw_search_button" class="btn">
            <i class="icon-search"></i>
        </button>
	</div>
</form>

{if $results|@count == 0 && $search != ""}
	<div class="nosearchresults">
		Your search - <strong>{$search|escape:'htmlall'}</strong> - did not match any headers.
		<br/><br/>
		Suggestions:
		<br/><br/>
		<ul>
		<li>Make sure all words are spelled correctly.</li>
		<li>Try different keywords.</li>
		<li>Try more general keywords.</li>
		<li>Try fewer keywords.</li>
		</ul>
	</div>
{elseif $search == ""}
{else}

{if !$userdata.hideads && $site->adbrowse != ""}
<table class="adblock" cellspacing="0" cellpadding="0"><tr><td>{$site->adbrowse}</td></tr></table><br />
{/if}

Selection:
<div class="checkbox_operations btn-group">
	<a class="btn btn-mini select_all" title="Select all items">All</a>
	<a class="btn btn-mini select_none" title="Select no items">None</a>
	<a class="btn btn-mini select_invert" title="Invert the current Selection">Invert</a>
	<a class="btn btn-mini select_range" title="Select everything between the current items">Range</a>
</div>

<form method="post" id="dl" name="dl" action="{$smarty.const.WWW_TOP}/searchraw">
<table style="width:100%;" class="data table table-bordered table-hover table-striped" id="browsetable">
	<tr>
		<th width="10"></th>
		<th>filename</th>
		<th>group</th>
		<th>posted</th>
		{if $isadmin}
		<th class="admin">Misc</th>
		<th class="admin">%</th>
		{/if}
		<th>Nzb</th>
	</tr>

	{foreach from=$results item=result}
		<tr>
			<td class="selection"><input name="file{$result.ID}" id="file{$result.ID}" value="{$result.ID}" type="checkbox"/></td>
			<td title="{$result.xref|escape:"htmlall"}">{$result.name|escape:"htmlall"}</td>
			<td class="less">{$result.group_name|replace:"alt.binaries":"a.b"}</td>
			<td class="less" title="{$result.date}">{$result.date|date_format}</td>
			{if $isadmin}
			<td class="admin error"><span title="procstat">{$result.procstat}</span>/<span title="procattempts">{$result.procattempts}</span>/<span title="totalparts">{$result.totalParts}</span>/<span title="regex">{if $result.regexID==""}_{else}{$result.regexID}{/if}</span>/<span title="relpart">{$result.relpart}</span>/<span title="reltotalpart">{$result.reltotalpart}</span></td>
			<td class="admin less error">{if $result.binnum < $result.totalParts}<span style="color:red;">{$result.binnum}/{$result.totalParts}</span>{else}100%{/if}</td>
			{/if}			
			<td class="less">{if $result.releaseID > 0}<a title="View Nzb details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.filename|escape:"seourl"}">Yes</a>{/if}</td>
		</tr>
	{/foreach}
	
</table>
</form>

Selection:
<div class="checkbox_operations btn-group">
	<a class="btn btn-mini select_all" title="Select all items">All</a>
	<a class="btn btn-mini select_none" title="Select no items">None</a>
	<a class="btn btn-mini select_invert" title="Invert the current Selection">Invert</a>
	<a class="btn btn-mini select_range" title="Select everything between the current items">Range</a>
</div>

<div style="padding-top:20px; display:none;">
	<a class="btn btn-mini" id="searchraw_download_selected">Download selected as Nzb</a>
</div>

{/if}
