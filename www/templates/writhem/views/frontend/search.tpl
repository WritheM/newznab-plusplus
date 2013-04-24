  
<h1>Search</h1>

<div style="text-align:right;">
</div>

<form method="get" action="{$smarty.const.WWW_TOP}/search">
  <input type="hidden" name="t" value="{if $category[0]!=""}{$category[0]}{else}-1{/if}" id="search_cat" />
  <input type="hidden" name="search_type" value="{if $sadvanced}adv{else}basic{/if}" id="search_type" />

  <table>
    <tr>
      <th><label for="id">Release Name:</label></th>
      <td>
        <div class="input-append">
          <input class="input" id="search" value="{$search|escape:'html'}" type="text"/>
                  
          <a id="bbasic" class="btn" onclick="jQuery('#sadvanced,#bbasic,#badvanced').toggle();jQuery('#search_type').val('adv');" {if $sadvanced || true}style="display:none"{/if}><i class="icon-plus"></i></a>
          <a id="badvanced" class="btn active" onclick="jQuery('#sadvanced,#bbasic,#badvanced').toggle();jQuery('#search_type').val('basic');" {if not $sadvanced}style="display:none"{/if}><i class="icon-minus"></i></a>
              
          <button type="submit" id="search_submit" class="btn">
            <i class="icon-search"></i>
          </button>
          </div>
      </td>
    </tr>    
  </table>

  <table id="sadvanced" {if not $sadvanced}style="display:none"{/if}>
    <tr>
      <th></th>
      <td>
        <script>
        jQuery(document).ready(function() { 
            var cookie = $.cookie('hide_advsearch');
            if (cookie) {
                jQuery('#alert_advsearch').hide();
            }
        }); 
        </script>
        <div id="alert_advsearch" class="alert alert-info">
          <button type="button" class="close" data-dismiss="alert" onclick="$.cookie('hide_advsearch','true');">&times;</button>
          <strong>Warning!</strong> The advanced search is very experimental.
        </div>
      </td>
    </tr>			
    <tr>
      <th><label for="searchadvf">Filename:</label></th>
      <td><input id="searchadvf" name="searchadvf" value="{$searchadvf|escape:'html'}" type="text"/></td>
    </tr>			
    <tr>
      <th><label for="searchadvposter">Poster:</label></th>
      <td><input id="searchadvposter" name="searchadvposter" value="{$searchadvposter|escape:'html'}" type="text"/></td>
    </tr>				
    <tr>
      <th><label for="searchadvgroups">Group:</label></th>
      <td>{html_options id="searchadvgroups" name=searchadvgroups options=$grouplist selected=$selectedgroup}</td>
    </tr>
    <tr>
      <th><label for="searchadvcat">Category:</label></th>
      <td>{html_options id="searchadvcat" name=searchadvcat options=$catlist selected=$selectedcat}</td>
    </tr>
    <tr>
      <th><label for="searchadvsizefrom">Size Between: &nbsp;</label></th>
      <td>
          {html_options id="searchadvsizefrom" name=searchadvsizefrom options=$sizelist selected=$selectedsizefrom}
          and {html_options id="searchadvsizeto" name=searchadvsizeto options=$sizelist selected=$selectedsizeto}
      </td>
    </tr>	
  </table>
</form>

{if $results|@count == 0 && $search != ""}
	<div class="alert alert-block">
		<h4>No result!</h4>
		Your search - <strong>{$search|escape:'htmlall'}</strong> - did not match any releases.
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

{if $site->adbrowse != ""}
<table class="adblock" cellspacing="0" cellpadding="0"><tr><td>{$site->adbrowse}</td></tr></table><br />
{/if}

<form style="padding-top:10px;" id="nzb_multi_operations_form" method="get" action="{$smarty.const.WWW_TOP}/search">
  <table width="100%">
    <tr>
      <td>{$pager}</td>
      <td style="text-align:right">
        <div class="nzb_multi_operations">
          <small>With selected:</small>
          <div class="btn-group">
            <button type="button" class="btn btn-mini nzb_multi_operations_download">
              <i class="icon-download"></i> Download NZBs
            </button>
            <button type="button" class="btn btn-mini nzb_multi_operations_cart">
              <i class="{$themevars.cart_icon}"></i> {$themevars.cart_name_add}
            </button>
            {if $sabintegrated}
            <button type="button" class="btn btn-mini nzb_multi_operations_sab">
              <i class="icon-download-alt"></i> Send to SAB
            </button>
            {/if}
            {if $isadmin}
            <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_edit">
              <i class="icon-edit icon-white"></i>
            </button>
            <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_delete">
              <i class="icon-trash icon-white"></i>
            </button>
            <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_rebuild">
              <i class="icon-repeat icon-white"></i>
            </button>
            {/if}
          </div>
        </div>
      </td>
    </tr>
  </table>
  <table style="width:100%;"  class="table table-bordered table-striped table-hover data highlight icons sorter" id="browsetable">
    <tr>
      <thead>
        <th style="padding:2px;"><input id="chkSelectAll" type="checkbox" class="nzb_check_all" /><label for="chkSelectAll" style="display:none;">Select All</label></th>
        <th>name<br/><a title="Sort Descending" href="{$orderbyname_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbyname_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
        <th>category<br/><a title="Sort Descending" href="{$orderbycat_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbycat_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
        <th>posted<br/><a title="Sort Descending" href="{$orderbyposted_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbyposted_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
        <th>size<br/><a title="Sort Descending" href="{$orderbysize_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbysize_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
        <th style="min-width:30px;">files<br/><a title="Sort Descending" href="{$orderbyfiles_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbyfiles_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
        <th style="min-width:30px;">stats<br/><a title="Sort Descending" href="{$orderbystats_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbystats_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
        <th></th>
      </thead>
    </tr>
	{foreach from=$results item=result}
		<tr class="{if $lastvisit|strtotime<$result.adddate|strtotime}success{/if}" id="guid{$result.guid}">
			<td style="padding:5px;" class="check"><input id="chk{$result.guid|substr:0:7}" type="checkbox" class="nzb_check" name="id[]" value="{$result.guid}" /></td>
			<td class="item">
				<label for="chk{$result.guid|substr:0:7}"><a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">{$result.searchname|escape:"htmlall"|replace:".":" "}</a></label>
				{if $result.passwordstatus == 2}
					<div class="label label-warning"><i class="icon-lock icon-white" title="Passworded Rar Archive"></i>Passworded Rar Archive</div>
				{elseif $result.passwordstatus == 1}
					<div class="label label-warning"><i class="icon-lock icon-white" title="Contains .cab/ace/rar Archive"></i>Contains .cab/ace/rar Archive</div>
				{elseif $result.passwordstatus == -1}
					<div class="label label-warning"><i class="icon-lock icon-white" title="Unable to determine Password status"></i>Potentially Passworded Release</div>
				{/if}
        {if $userdata.canpre == 1 && $result.nuketype != ''}
          <div class="badge label-warning">
            <i class="icon-warning-sign icon-white" title="{$result.nukereason}"></i>
            {if preg_match('/^(UN)?((MOD)?NUKED?|DELPRE|MOD|LOCAL)$/', $result.nuketype)}
                {$result.nuketype}
            {/if}
          </div>
        {/if}
				<div class="resextra">
					<div class="btn-group">
						{if $result.nfoID > 0}<a href="{$smarty.const.WWW_TOP}/nfo/{$result.guid}" title="View Nfo" class="btn btn-mini modal_nfo" rel="nfo">Nfo</a>{/if}
						{if $result.preID > 0 && $userdata.canpre == 1}<span class="preinfo btn btn-mini disabled" title="{$result.searchname}">Pre'd {$result.ctime|timeago}</span>{/if}
						{if $result.movieinfoID > 0}<a href="{$smarty.const.WWW_TOP}/movies?imdb={$result.imdbID}" title="View movie info" class="btn btn-mini" rel="movie" >Movie</a>{/if}
						{if $result.haspreview == 1 && $userdata.canpreview == 1}<a href="{$smarty.const.WWW_TOP}/covers/preview/{$result.guid}_thumb.jpg" name="name{$result.guid}" title="View Screenshot" class="modal_prev btn btn-mini" rel="preview">Preview</a>{/if}
						{if $result.haspreview == 2 && $userdata.canpreview == 1}<a href="#" name="audio{$result.guid}" title="Listen to Preview" class="audioprev btn btn-mini" rel="audio">Listen</a><audio id="audprev{$result.guid}" src="{$smarty.const.WWW_TOP}/covers/audio/{$result.guid}.mp3" preload="none"></audio>{/if}
						{if $result.rageID > 0}<a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/series/{$result.rageID}" title="View all episodes">View Series</a>{/if}
						{if $result.anidbID > 0}<a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/anime/{$result.anidbID}" title="View all episodes">View Anime</a>{/if}
						{if $result.consoleinfoID > 0}<a href="#" name="name{$result.consoleinfoID}" title="View console info" class="modal_console btn btn-mini" rel="console" >Cover</a>{/if}
						{if $result.musicinfoID > 0}<a href="#" name="name{$result.musicinfoID}" title="View music info" class="modal_music btn btn-mini" rel="music" >Cover</a>{/if}
						{if $result.bookinfoID > 0}<a href="#" name="name{$result.bookinfoID}" title="View book info" class="modal_book btn btn-mini" rel="console" >Cover</a>{/if}
						{if $result.tvairdate != ""}<span class="btn btn-mini disabled" title="{$result.tvtitle} Aired on {$result.tvairdate|date_format}">Aired {if $result.tvairdate|strtotime > $smarty.now}in future{else}{$result.tvairdate|daysago}{/if}</span>{/if}
						{if $result.reID > 0}<span class="mediainfo btn btn-mini disabled" title="{$result.guid}">Media</span>{/if}
						{if $result.reRes > 0}
              <span class="btn btn-mini disabled" title="{$result.reVideo.videowidth}x{$result.reVideo.videoheight}">
              {if $result.reRes == 1}SD
              {elseif $result.reRes == 2}HD
              {elseif $result.reRes == 3}HD+
              {/if}
              </span>
            {/if}
					</div>
          {foreach from=$result.reAudio item=audio}
						{if $audio.audioflag != ""}
							<i class="icon-flag {$audio.audioflag}" title="{$audio.audiolanguage}-{$audio.audioformat}"></i>
						{/if}
					{/foreach}
				</div>
			</td>
			<td class="less"><a title="Browse {$result.category_name}" href="{$smarty.const.WWW_TOP}/browse?t={$result.categoryID}">{$result.category_name}</a></td>
			<td class="less mid" title="{$result.postdate}">{$result.postdate|timeago}</td>
			<td class="less right" width="55">{$result.size|fsize_format:"MB"}{if $result.completion > 0}<br />{if $result.completion < 100}<span class="warning">{$result.completion}%</span>{else}{$result.completion}%{/if}{/if}</td>
			<td class="less mid">
				<a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$result.guid}">{$result.totalpart}</a>
				{if $result.rarinnerfilecount > 0}
					<div class="rarfilelist">
						<i class="icon-file" style="opacity:0.2;"></i><img src="{$smarty.const.WWW_TOP}/templates/writhem/images/icons/magnifier.png" alt="{$result.guid}" class="tooltip" />				
					</div>
				{/if}			
			</td>
			<td class="less nowrap">
        <div{if $result.comments < 1} style="opacity:0.2;"{/if}>
          <a title="View comments" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/#comments">{writhem_browse_comment_count guid=$result.guid}<i class="icon-comment"></i></a>
        </div>
        <div{if $result.grabs < 1} style="opacity:0.2;"{/if}>
            {$result.grabs}<i class="icon-download" title="Grabs"></i>
        </div>
      </td>
			<td class="icons">
				<div class="icon icon_nzb"><a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$result.guid}/{$result.searchname|escape:"url"}">&nbsp;</a></div>
				<div class="icon icon_cart" title="{$themevars.cart_name_add}"></div>
				{if $sabintegrated}
          <div class="icon icon_sab" title="Send to my Sabnzbd"></div>
        {/if}
			</td>
		</tr>
	{/foreach}
  </table>

{if $results|@count > 10}
<table width="100%">
  <tr>
    <td>{$pager}</td>
    <td style="text-align:right">
      <div class="nzb_multi_operations">
        <small>With selected:</small>
        <div class="btn-group">
          <button type="button" class="btn btn-mini nzb_multi_operations_download"><i class="icon-download"></i> Download NZBs</button>
          <button type="button" class="btn btn-mini nzb_multi_operations_cart"><i class="{$themevars.cart_icon}"></i> {$themevars.cart_name_add}</button>
          {if $sabintegrated}
          <button type="button" class="btn btn-mini nzb_multi_operations_sab"><i class="icon-download-alt"></i> Send to SAB</button>
          {/if}
          {if $isadmin}
            <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_edit"><i class="icon-edit icon-white"></i></button>
            <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_delete"><i class="icon-trash icon-white"></i></button>
            <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_rebuild"><i class="icon-repeat icon-white"></i></button>
          {/if}
        </div>
      </div>
    </td>
  </tr>
</table>
{/if}

</form>








{/if}

