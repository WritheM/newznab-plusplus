{if $nodata != ""}
	<h1>View TV Series</h1>
	<p>{$nodata}</p>
{else}
  <h1>
  {foreach $rage as $r}
    {if $isadmin}
      <a class="btn btn-danger btn-small" title="Edit rage data" href="{$smarty.const.WWW_TOP}/admin/rage-edit.php?id={$r.ID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}">{$r.releasetitle} </a>
    {else}
      {$r.releasetitle} 
    {/if}
    {if !$r@last} / {/if}
  {/foreach}

  {if $catname != ''} in {$catname|escape:"htmlall"}{/if}

  </h1>

  <div class="tvseriesheading">
    {if $rage[0].imgdata != ""}<img class="shadow" alt="{$rage[0].releasetitle} Logo" src="{$smarty.const.WWW_TOP}/getimage?type=tvrage&amp;id={$rage[0].ID}" />{/if}
    <p>
      {if $seriesgenre != ''}<b>{$seriesgenre}</b><br />{/if}

      {if $seriesdescription|strlen > 100}
      <span id="descinitial">{$seriesdescription|escape:"htmlall"|nl2br|magicurl|truncate:"100"} <a onclick="jQuery('#descinitial,#descfull').toggle();" class="btn btn-mini" class="descmore">more...</a></span>

      <span style="display:none;"{else}<span {/if}id="descfull">{$seriesdescription|escape:"htmlall"|nl2br|magicurl} <a onclick="jQuery('#descinitial,#descfull').toggle();" class="btn btn-mini" class="descmore" >less...</a></span>
    </p>

  </div>
  <div class="btn-group">
    <a class="btn btn-small" title="Manage your shows" href="{$smarty.const.WWW_TOP}/myshows">My Shows</a>
    {if $myshows.ID != ''}
      <a class="btn btn-small" href="{$smarty.const.WWW_TOP}/myshows/delete/{$rage[0].rageID}?from={$smarty.server.REQUEST_URI|escape:"url"}" class="myshows" rel="remove" name="series{$rage[0].rageID}" title="Remove from My Shows"><i class="icon-minus-sign"></i></a>
      <a class="btn btn-small" href="{$smarty.const.WWW_TOP}/myshows/edit/{$rage[0].rageID}?from={$smarty.server.REQUEST_URI|escape:"url"}" class="myshows" rel="edit" name="series{$rage[0].rageID}" title="Edit Categories for this show"><i class="icon-edit"></i></a>
    {else}
      <a class="btn btn-small" href="{$smarty.const.WWW_TOP}/myshows/add/{$rage[0].rageID}?from={$smarty.server.REQUEST_URI|escape:"url"}" class="myshows" rel="add" name="series{$rage[0].rageID}" title="Add to My Shows"><i class="icon-plus-sign"></i></a>
    {/if}
  </div>

  <form id="nzb_multi_operations_form" action="get">
    <div class="btn-group">
      {if $rage|@count == 1 && $isadmin}<a class="btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/admin/rage-edit.php?id={$r.ID}&amp;action=update&amp;from={$smarty.server.REQUEST_URI|escape:"url"}">Update From Tv Rage</a> | {/if}
      <a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}http://www.tvrage.com/shows/id-{$rage[0].rageID}" title="View in TvRage">View in Tv Rage</a> | 
      <a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/rss?rage={$rage[0].rageID}{if $category != ''}&amp;t={$category}{/if}&amp;dl=1&amp;i={$userdata.ID}&amp;r={$userdata.rsstoken}">Series RSS <i class="fa-icon-rss"></i></a>
    </div>
    <div class="nzb_multi_operations">  
      <small>With selected:</small>
      <div class="btn-group">
        <button type="button" class="btn btn-mini nzb_multi_operations_download"><i class="icon-download"></i> Download NZBs</button>
        <button type="button" class="btn btn-mini nzb_multi_operations_cart"><i class="{$themevars.cart_icon}"></i> {$themevars.cart_name_add}</button>
        {if $sabintegrated}<button type="button" class="btn btn-mini nzb_multi_operations_sab"><i class="icon-download-alt"></i> Send to SAB</button>{/if}
        {if $isadmin}
          <button type="button" class="btn btn-mini btn-danger nzb_multi_operations_edit"><i class="icon-edit icon-white"></i></button>
          <button type="button" class="btn btn-mini btn-danger nzb_multi_operations_delete"><i class="icon-trash icon-white"></i></button>
        {/if}
      </div>
    </div>
    <br clear="all" />
    <a id="latest"></a>
    <ul class="nav nav-tabs" style="margin:10px 0 0 0;">
    {foreach $seasons as $seasonnum => $season name="seas"}
      <li class="tabs{if $smarty.foreach.seas.first} active" style="margin-left:23px;{/if}">
        <a id="seas_{$seasonnum}" title="View Season {$seasonnum}" href="#{$seasonnum}">{$seasonnum}</a>
      </li>
    {/foreach}
    </ul>
    
    {foreach $seasons as $seasonnum => $season name=tv}
    <div class="dv_{$seasonnum} tabbable tabs-left" style="{if !$smarty.foreach.tv.first}display:none;{/if}margin: -1px -15px 0px -20px;" >
      <ul class="ul_{$seasonnum} nav nav-tabs tabs-left">
      {foreach $season as $episodenum => $episodes name="epis"}
        <li class="tabs{if $smarty.foreach.epis.first} active{/if}">
          <a id="epis_{$seasonnum}{$episodenum}" class="seas_{$seasonnum}" title="View Episode {$episodenum}" href="#{$seasonnum}{$episodenum}" style="min-width: 0px;">{$episodenum}</a>
        </li>
      {/foreach}
      </ul>
      
      {foreach $season as $episodenum => $episodes name="epis"}
      <table style="width:90%; border-top: 0px; margin-left:-15px; background-color:white; {if !$smarty.foreach.epis.first}display:none;{/if}" class="tb_{$seasonnum}{$episodenum} data highlight icons table" id="browsetable">
        <tr>
          <td style="padding-top:15px;" colspan="10"><h2>Season {$seasonnum} Episode {$episodenum}</h2></td>
        </tr>
        <tr>
          <th>Name</th>
          <th><input id="chkSelectAll{$seasonnum}" type="checkbox" name="{$seasonnum}" class="nzb_check_all_season" /><label for="chkSelectAll{$seasonnum}" style="display:none;">Select All</label></th>
          <th>Category</th>
          <th style="text-align:center;">Posted</th>
          <th>Size</th>
          <th>Files</th>
          <th>Stats</th>
          <th></th>
        </tr>
          {foreach $episodes as $results => $result name="res"}
            <tr class="{cycle values=",alt"}" id="guid{$result.guid}">
              <td>
                <a title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">{$result.searchname|escape:"htmlall"|replace:".":" "}</a>
                <div class="resextra">
                  <div class="btn-group">
                    {if $result.nfoID > 0}<a href="{$smarty.const.WWW_TOP}/nfo/{$result.guid}" title="View Nfo" class="modal_nfo btn btn-mini" rel="nfo">Nfo</a>{/if}
                    {if $result.haspreview == 1 && $userdata.canpreview == 1}<a href="{$smarty.const.WWW_TOP}/covers/preview/{$result.guid}_thumb.jpg" name="name{$result.guid}" title="View Screenshot" class="modal_prev btn btn-mini" rel="preview">Preview</a>{/if}
                    {if $result.tvairdate != ""}<span class="btn btn-mini" title="{$result.tvtitle} Aired on {$result.tvairdate|date_format}">Aired {if $result.tvairdate|strtotime > $smarty.now}in future{else}{$result.tvairdate|daysago}{/if}</span>{/if}
                    {if $result.reID > 0}<span class="mediainfo btn btn-mini" title="{$result.guid}">Media</span>{/if}
                  {if $isadmin}
                    <a class="btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/admin/release-edit.php?id={$result.ID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Edit Release"><i class="icon-edit icon-white"></i></a> 
                    <a class="btn btn-mini btn-danger confirm_action" href="{$smarty.const.WWW_TOP}/admin/release-delete.php?id={$result.ID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Delete Release"><i class="icon-trash icon-white"></i></a>
                  {/if}			
                  </div>
                </div>
              </td>
              <td class="check"><input id="chk{$result.guid|substr:0:7}" type="checkbox" class="nzb_check" name="{$seasonnum}" value="{$result.guid}" /></td>
              <td class="less"><a title="This series in {$result.category_name}" href="{$smarty.const.WWW_TOP}/series/{$result.rageID}?t={$result.categoryID}">{$result.category_name}</a></td>
              <td class="less mid" width="40" title="{$result.postdate}">{$result.postdate|timeago}</td>
              <td width="40" class="less right">{$result.size|fsize_format:"MB"}{if $result.completion > 0}<br />{if $result.completion < 100}<span class="warning">{$result.completion}%</span>{else}{$result.completion}%{/if}{/if}</td>
              <td class="less mid">
                <a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$result.guid}">{$result.totalpart}</a>
                {if $result.rarinnerfilecount > 0}
                  <div class="rarfilelist">
                    <i class="icon-file" style="opacity:0.2;"></i><img alt="{$result.guid}" class="tooltip" />
                  </div>
                {/if}							
              </td>
              <td width="40" class="less nowrap">
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
      {/foreach}
    </div>
    {/foreach}
  </form>
{/if}
