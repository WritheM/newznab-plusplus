<h1>{$page->title}</h1>

<div class="pagination pagination-mini">
  <ul style="padding-bottom:1.5px;">
    <li{if $animeletter == '0-9'} class="active"{/if}>
      <a href="{$smarty.const.WWW_TOP}/series/0-9">0-9</a>
    </li>
    {foreach $animerange as $range}
      <li{if $range == $animeletter} class="active"{/if}>
          <a href="{$smarty.const.WWW_TOP}/series/{$range}">{$range}</a>
      </li>
    {/foreach}
  </ul>
  <form style="float:right;"class="form-search" name="anidbsearch" action="" method="get">
    <div class="input-append">
        <input id="title" name="title" type="text" class="span2 search-query" value="{$animetitle|escape:'html'}" placeholder="Search TV Series">
        <button type="submit" value="Go" class="btn"><i class="icon-search"></i></button>
    </div>
  </form>
</div>

{if !$userdata.hideads && $site->adbrowse != ""}
<table class="adblock" cellspacing="0" cellpadding="0"><tr><td>{$site->adbrowse}</td></tr></table><br />
{/if}

{if $animelist|@count > 0}

<table style="width:100%;" class="data highlight icons" id="browsetable">
	{foreach $animelist as $aletter => $anime}
		<tr>
			<td style="padding-top:15px;" colspan="10"><a href="#top" class="top_link">Top</a><h2>{$animeletter}...</h2></td>
		</tr>
		<tr>
			<th width="40%">Name</th>
			<th width="10%" style="text-align: center;">Type</th>
			<th width="35%" style="text-align: center;">Categories</th>
			<th width="5%" style="text-align: center;">Rating</th>
			<th style="text-align: center;">View</th>
		</tr>
		{foreach $anime as $a}
			<tr class="{cycle values=",alt"}">
				<td><a class="title" title="View anime" href="{$smarty.const.WWW_TOP}/anime/{$a.anidbID}">{$a.title|escape:"htmlall"}</a>{if {$a.startdate} != ''}<br />({$a.startdate|date_format} - {/if}{if $a.enddate != ''}{$a.enddate|date_format}{/if})</td>
				<td style="text-align: center;">{if {$a.type} != ''}{$a.type|escape:"htmlall"}{/if}</td>
				<td>{if {$a.categories} != ''}{$a.categories|escape:"htmlall"|replace:'|':', '}{/if}</td>
				<td style="text-align: center;">{if {$a.rating} != ''}{$a.rating}{/if}</td>
				<td style="text-align: center;"><a title="View at AniDB" target="_blank" href="{$site->dereferrer_link}http://anidb.net/perl-bin/animedb.pl?show=anime&aid={$a.anidbID}">AniDB</a></td>
			</tr>
		{/foreach}
	{/foreach}
</table>

{else}
<h2>No results</h2>
{/if}
