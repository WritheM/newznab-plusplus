<ul class="breadcrumb">
	<li><a href="{$smarty.const.WWW_TOP}{$site->home_link}">Home</a> <span class="divider">/</span></li>
	<li class="active">{$catname|escape:"htmlall"}</li>
</ul>

{if $site->adbrowse != ""}
<table class="adblock" cellspacing="0" cellpadding="0"><tr><td>{$site->adbrowse}</td></tr></table><br />
{/if}

{if $shows}
<center>
<div class="btn-group">
	<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/series" title="View available TV series">Series List</a> | 
	<a class="btn btn-small" title="Manage your shows" href="{$smarty.const.WWW_TOP}/myshows">Manage My Shows</a> | 
	<a class="btn btn-small" title="All releases in your shows as an RSS feed" href="{$smarty.const.WWW_TOP}/rss?t=-3&amp;dl=1&amp;i={$userdata.ID}&amp;r={$userdata.rsstoken}">Rss <i class="fa-icon-rss"></i></a>
</div>
</center>
<br/>
{/if}

{if $results|@count > 0}

<form id="nzb_multi_operations_form" action="get">

  <table width="100%">
    <tr>
      <td>{$pager}</td>
      <td style="text-align:right"><div class="nzb_multi_operations">
        <small>With selected:</small>
        <div class="btn-group">
        <button type="button" class="btn btn-mini nzb_multi_operations_download"><i class="icon-download"></i> Download NZBs</button>
        <button type="button" class="btn btn-mini nzb_multi_operations_cart"><i class="{$themevars.cart_icon}"></i> {$themevars.cart_name_add}</button>
        {if $sabintegrated}<button type="button" class="btn btn-mini nzb_multi_operations_sab"><i class="icon-download-alt"></i> Send to SAB</button>{/if}
        {if $isadmin}
          <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_edit"><i class="icon-edit icon-white"></i></button>
          <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_delete"><i class="icon-trash icon-white"></i></button>
          <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_rebuild"><i class="icon-repeat icon-white"></i></button>
        {/if}</div>
      {if $category==1000}<div class="btn-group"><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/console" title="Covers"><i class="icon-picture"></i></a><span class="btn btn-mini disabled"><i class="icon-list"></i></span></div>
      {elseif $category==2000}<div class="btn-group"><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/movies" title="Covers"><i class="icon-picture"></i></a><span class="btn btn-mini disabled"><i class="icon-list"></i></span></div>
      {elseif $category==3000}<div class="btn-group"><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/music" title="Covers"><i class="icon-picture"></i></a><span class="btn btn-mini disabled"><i class="icon-list"></i></span></div>
      {elseif $category==7020}<div class="btn-group"><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/books" title="Covers"><i class="icon-picture"></i></a><span class="btn btn-mini disabled"><i class="icon-list"></i></span></div>
      {/if}
      </div>
      </td>
    </tr>
  </table>

  <table style="width:100%;" class="table table-bordered table-striped table-hover data highlight icons" id="browsetable">

		<tr>
			<th style="padding-top:0px; padding-bottom:0px;">
				<input id="chkSelectAll" type="checkbox" class="nzb_check_all" />
				<label for="chkSelectAll" style="display:none;">Select All</label>
			</th>

			<th style="padding-top:0px; padding-bottom:0px;">name<br/>
				<a title="Sort Descending" href="{$orderbyname_desc}">
					<i class="fa-icon-caret-down"></i>
				</a>
				<a title="Sort Ascending" href="{$orderbyname_asc}">
					<i class="fa-icon-caret-up"></i>
				</a>
			</th>

			<th style="padding-top:0px; padding-bottom:0px;">category<br/>
				<a title="Sort Descending" href="{$orderbycat_desc}">
					<i class="fa-icon-caret-down"></i>
				</a>
				<a title="Sort Ascending" href="{$orderbycat_asc}">
					<i class="fa-icon-caret-up"></i>
				</a>
			</th>

			<th style="padding-top:0px; padding-bottom:0px;">posted<br/>
				<a title="Sort Descending" href="{$orderbyposted_desc}">
					<i class="fa-icon-caret-down"></i>
				</a>
				<a title="Sort Ascending" href="{$orderbyposted_asc}">
					<i class="fa-icon-caret-up"></i>
				</a>
			</th>

			<th style="padding-top:0px; padding-bottom:0px;">size<br/>
				<a title="Sort Descending" href="{$orderbysize_desc}">
					<i class="fa-icon-caret-down"></i>
				</a>
				<a title="Sort Ascending" href="{$orderbysize_asc}">
					<i class="fa-icon-caret-up"></i>
				</a>
			</th>

			<th style="padding-top:0px; padding-bottom:0px; min-width:25px;">files<br/>
				<a title="Sort Descending" href="{$orderbyfiles_desc}">
					<i class="fa-icon-caret-down"></i>
				</a>
				<a title="Sort Ascending" href="{$orderbyfiles_asc}">
					<i class="fa-icon-caret-up"></i>
				</a>
			</th>

			<th style="padding-top:0px; padding-bottom:0px; min-width:25px;">stats<br/>
				<a title="Sort Descending" href="{$orderbystats_desc}">
					<i class="fa-icon-caret-down"></i>
				</a>
				<a title="Sort Ascending" href="{$orderbystats_asc}">
					<i class="fa-icon-caret-up"></i>
				</a>
			</th>
			<th style="padding-top:0px; padding-bottom:0px; width:1px;">action</th>
		</tr>

		{foreach from=$results item=result}
		<tr class="{if $lastvisit|strtotime<$result.adddate|strtotime}success{/if}" id="guid{$result.guid}">
			<td class="check"><input id="chk{$result.guid|substr:0:7}" type="checkbox" class="nzb_check" value="{$result.guid}" /></td>
			<td class="item">
        <label for="chk{$result.guid|substr:0:7}"><a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">{$result.searchname|escape:"htmlall"|replace:".":" "}</a></label>
        {if $result.passwordstatus == 2}
          <div class="label label-warning"><i class="icon-lock icon-white" title="Passworded Rar Archive"></i>Passworded Rar Archive</div>
        {elseif $result.passwordstatus == 1}
          <div class="label label-warning"><i class="icon-lock icon-white" title="Contains .cab/ace/rar Archive"></i>Contains .cab/ace/rar Archive</div>
        {elseif $result.passwordstatus == -1}
          <div class="label label-warning"><i class="icon-lock icon-white" title="Unable to determine Password status"></i>Unknown password status</div>
        {/if}
				{if $userdata.canpre == 1 && $result.nuketype != ''}
          <div class="badge label-warning">
            <i class="icon-warning-sign icon-white" title="{$result.nukereason}"></i>
            {if preg_match('/^(UN)?((MOD)?NUKED?|DELPRE|MOD|LOCAL)$/', $result.nuketype)}
                {$result.nuketype|lower|capitalize}.{$result.nukereason}
            {/if}
          </div>
				{/if}
				
				<div class="resextra">
					<div class="btn-group">{strip}
						{if $result.nfoID > 0}<a href="{$smarty.const.WWW_TOP}/nfo/{$result.guid}" title="View Nfo" class="modal_nfo btn btn-mini" rel="nfo">Nfo</a>{/if}
						{if $result.preID > 0 && $userdata.canpre == 1}<span class="preinfo btn btn-mini disabled" title="{$result.searchname}">Pre'd {$result.ctime|timeago}</span>{/if}
						{if $result.movieinfoID > 0}<a href="{$smarty.const.WWW_TOP}/movies?imdb={$result.imdbID}" title="View movie info" class="btn btn-mini" rel="movie" >Movie</a>{/if}
						{if $result.haspreview == 1}
              {if $userdata.canpreview == 1}<a href="{$smarty.const.WWW_TOP}/covers/preview/{$result.guid}_thumb.jpg" name="name{$result.guid}" title="View Screenshot" class="modal_prev btn btn-mini" rel="preview">Preview</a>
              {/if}
            {/if}
						{if $result.haspreview == 2}
              {if $userdata.canpreview == 1}<a href="#" name="audio{$result.guid}" title="Listen to Preview" class="audioprev btn btn-mini" rel="audio">Listen</a><audio id="audprev{$result.guid}" src="{$smarty.const.WWW_TOP}/covers/audio/{$result.guid}.mp3" preload="none"></audio>
              {/if}
            {/if}
						{if $result.musicinfoID > 0}<a href="#" name="name{$result.musicinfoID}" title="View music info" class="modal_music btn btn-mini" rel="music" >Cover</a>{/if}
						{if $result.consoleinfoID > 0}<a href="#" name="name{$result.consoleinfoID}" title="View console info" class="modal_console btn btn-mini" rel="console" >Cover</a>{/if}
						{if $result.bookinfoID > 0}<a href="#" name="name{$result.bookinfoID}" title="View book info" class="modal_book btn btn-mini" rel="console" >Cover</a>{/if}
						{if $result.rageID > 0}<a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/series/{$result.rageID}" title="View all episodes">View Series</a>{/if}
						{if $result.anidbID > 0}<a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/anime/{$result.anidbID}" title="View all episodes">View Anime</a>{/if}
						{if $result.tvairdate != ""}<span class="seriesinfo btn btn-mini disabled" title="{$result.guid}">Aired {if $result.tvairdate|strtotime > $smarty.now}in future{else}{$result.tvairdate|daysago}{/if}</span>{/if}
						{if $result.reID > 0}<span class="mediainfo btn btn-mini disabled" title="{$result.guid}">Media</span>{/if}
            {if $result.reRes > 0}
              <span class="btn btn-mini disabled" title="{$result.reVideo.videowidth}x{$result.reVideo.videoheight}">
              {if $result.reRes == 1}SD
              {elseif $result.reRes == 2}HD
              {elseif $result.reRes == 3}HD+
              {/if}
              </span>
            {/if}
					{/strip}</div>
          {foreach from=$result.reAudio item=audio}
						{if $audio.audiolanguage != ""}
							<i class="icon-flag flag {$audio.audiolanguage|lower|replace:' ':'_'|replace:'(':''|replace:')':''}" title="{$audio.audiolanguage}-{$audio.audioformat}"></i>
						{/if}
					{/foreach}
				</div>
			</td>
			
			<td class="less">
				<a title="Browse {$result.category_name}" href="{$smarty.const.WWW_TOP}/browse?t={$result.categoryID}">{$result.category_name}</a>
			</td>

			<td class="less mid" title="{$result.postdate}">{$result.postdate|timeago}</td>
			<td class="less right">{$result.size|fsize_format:"MB"}{if $result.completion > 0}<br />{if $result.completion < 100}<span class="warning">{$result.completion}%</span>{else}{$result.completion}%{/if}{/if}</td>
			<td class="less mid">
				<a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$result.guid}">{$result.totalpart}</a>
				{if $result.rarinnerfilecount > 0}
					<div class="rarfilelist">
						<i class="icon-file" style="opacity:0.2;"></i><img alt="{$result.guid}" class="tooltip" />
					</div>
				{/if}
			</td>
			<td class="less nowrap">
        <div{if $result.comments < 1} style="opacity:0.2;"{/if}>
          <a title="View comments" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/#comments">{writhem_browse_comment_count guid=$result.guid}<i class="icon-comment"></i></a>
        </div>
        <div{if $result.grabs < 1} style="opacity:0.2;"{/if}>
          {$result.grabs}<i class="icon-download"></i>
        </div>
      </td>
			<td class="icons">
				<div class="icon icon_nzb"><a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$result.guid}/{$result.searchname|escape:"url"}">&nbsp;</a></div>
				<div class="icon icon_cart" title="{$themevars.cart_name_add}"></div>
				{if $sabintegrated}<div class="icon icon_sab" title="Send to my Sabnzbd"></div>{/if}
			</td>
		</tr>
		{/foreach}
	</table>

	{if $results|@count > 10}
  <table width="100%">
    <tr><td>
    {$pager}</td>
      <td style="text-align:right"><div class="nzb_multi_operations">
        <small>With selected:</small><div class="btn-group">
        <button type="button" class="btn btn-mini nzb_multi_operations_download"><i class="icon-download"></i> Download NZBs</button>
        <button type="button" class="btn btn-mini nzb_multi_operations_cart"><i class="{$themevars.cart_icon}"></i> {$themevars.cart_name_add}</button>
        {if $sabintegrated}<button type="button" class="btn btn-mini nzb_multi_operations_sab"><i class="icon-download-alt"></i> Send to SAB</button>{/if}

        {if $isadmin}
          <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_edit"><i class="icon-edit icon-white"></i></button>
          <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_delete"><i class="icon-trash icon-white"></i></button>
          <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_rebuild"><i class="icon-repeat icon-white"></i></button>
        {/if}</div>

        {if $category==1000}<div class="btn-group"><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/console" title="Covers"><i class="icon-picture"></i></a><span class="btn btn-mini disabled"><i class="icon-list"></i></span></div>
        {elseif $category==2000}<div class="btn-group"><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/movies" title="Covers"><i class="icon-picture"></i></a><span class="btn btn-mini disabled"><i class="icon-list"></i></span></div>
        {elseif $category==3000}<div class="btn-group"><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/music" title="Covers"><i class="icon-picture"></i></a><span class="btn btn-mini disabled"><i class="icon-list"></i></span></div>
        {elseif $category==7020}<div class="btn-group"><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/books" title="Covers"><i class="icon-picture"></i></a><span class="btn btn-mini disabled"><i class="icon-list"></i></span></div>
        {/if}
      </div></td>
    </tr>
  </table>
	{/if}
	
</form>

{else}
<div class="alert">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Sorry!</strong> There is nothing here at the moment.
</div>
{/if}
