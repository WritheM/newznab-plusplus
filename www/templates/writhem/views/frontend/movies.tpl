<h1>Browse {$catname}</h1>
<form name="browseby" action="movies">
<table border="0" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="movietitle">Title&nbsp;&nbsp;&nbsp;</label></span>
				<input class="span2" id="movietitle" type="text" name="title" value="{$title}" size="15" />
			</div>
		</td>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="movieactors">Actor</label></span>
				<input class="span2" id="movieactors" type="text" name="actors" value="{$actors}" size="15" />
			</div>
		</td>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="moviedirector">Director&nbsp;</label></span>
				<input class="span2" id="moviedirector" type="text" name="director" value="{$director}" size="15" />
			</div>
		</td>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="rating">Rating</label></span>
				<select class="span2" id="rating" name="rating">
					<option class="grouping" value=""></option>
					{foreach from=$ratings item=rate}
						<option {if $rating==$rate}selected="selected"{/if} value="{$rate}">{$rate}</option>
					{/foreach}
				</select>
			</div>
		</td>
	</tr><tr>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="genre">Genre</label></span>
				<select class="span2" id="genre" name="genre">
					<option class="grouping" value=""></option>
					{foreach from=$genres item=gen}
						<option {if $gen==$genre}selected="selected"{/if} value="{$gen}">{$gen}</option>
					{/foreach}
				</select>
			</div>
		</td>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="year">Year&nbsp;</label></span>
				<select class="span2" id="year" name="year">
					<option class="grouping" value=""></option>
					{foreach from=$years item=yr}
						<option {if $yr==$year}selected="selected"{/if} value="{$yr}">{$yr}</option>
					{/foreach}
				</select>
			</div>
		</td>
		<td>
			<div class="input-prepend">
				<span class="add-on"><label for="category">Category</label></span>
				<select class="span2" id="category" name="t">
					<option class="grouping" value="2000"></option>
					{foreach from=$catlist item=ct}
						<option {if $ct.ID==$category}selected="selected"{/if} value="{$ct.ID}">{$ct.title}</option>
					{/foreach}
				</select>
			</div>
		</td>
		<td><button class="btn btn-small" type="submit"><i class="icon-filter"></i> Apply Filter</button>
	</tr>
</table>
</form>

<p></p>

{if !$userdata.hideads && $site->adbrowse != ""}
<table class="adblock" cellspacing="0" cellpadding="0"><tr><td>{$site->adbrowse}</td></tr></table><br />
{/if}

{if $results|@count > 0}

<form id="nzb_multi_operations_form" action="get">

<table width="100%">
  <tr>
    <td>{$pager}</td>
    <td style="text-align:right">
      <div class="nzb_multi_operations">
        <small>With selected:</small>
        <div class="btn-group">
          <button type="button" class="btn btn-mini nzb_multi_operations_download"><i class="icon-download"></i> Download NZBs</button>
          <button type="button" class="btn btn-mini nzb_multi_operations_cart"><i class="{$themevars.cart_icon}"></i> {$themevars.cart_name_add}</button>
          {if $sabintegrated}<button type="button" class="btn btn-mini nzb_multi_operations_sab"><i class="icon-download-alt"></i> Send to SAB</button>{/if}
          {if $isadmin}
            <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_edit"><i class="icon-edit icon-white"></i></button>
            <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_delete"><i class="icon-trash icon-white"></i></button>
            <button type="button" class="btn btn-mini btn-inverse nzb_multi_operations_rebuild"><i class="icon-repeat icon-white"></i></button>
          {/if}
        </div>
        <div class="btn-group">
          <span class="btn btn-mini active"><i class="icon-picture"></i></span><a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/browse?t={$category}" title="List"><i class="icon-list"></i></a>
        </div>
      </div>
    </td>
  </tr>
</table>

<table style="width:100%;" class="table table-bordered table-striped data highlight icons" id="coverstable">
	<tr>
		<th width="130"><input type="checkbox" class="nzb_check_all" /></th>
		<th>title<br/><a title="Sort Descending" href="{$orderbytitle_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbytitle_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
		<th>year<br/><a title="Sort Descending" href="{$orderbyyear_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbyyear_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
		<th>rating<br/><a title="Sort Descending" href="{$orderbyrating_desc}"><i class="fa-icon-caret-down" title="desc"></i></a><a title="Sort Ascending" href="{$orderbyrating_asc}"><i class="fa-icon-caret-up" title="asc"></i></a></th>
	</tr>

	{foreach from=$results item=result}
		<tr class="{cycle values=",alt"}">
			<td class="mid">
				<div class="movcover">
					<a target="_blank" href="{$site->dereferrer_link}http://www.imdb.com/title/tt{$result.imdbID}/" name="name{$result.imdbID}" title="View movie info" class="modal_imdb" rel="movie" >
						<img class="img-polaroid" src="{$smarty.const.WWW_TOP}/covers/movies/{if $result.cover == 1}{$result.imdbID}-cover.jpg{else}no-cover.jpg{/if}" width="120" border="0" alt="{$result.title|escape:"htmlall"}" />
					</a>
					<div class="btn-group movextra">
						<a class="btn btn-mini modal_imdb" target="_blank" href="{$site->dereferrer_link}http://www.imdb.com/title/tt{$result.imdbID}/" name="name{$result.imdbID}" title="View movie info" rel="movie" >Cover</a>
						<a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}http://www.imdb.com/title/tt{$result.imdbID}/" name="imdb{$result.imdbID}" title="View imdb page">Imdb</a>
					</div>
				</div>
			</td>
			<td colspan="3" class="left">
				<h2><a title="View Movie" href="{$smarty.const.WWW_TOP}/movies/?imdb={$result.imdbID}">{$result.title|escape:"htmlall"}</a> (<a class="title" title="{$result.year}" href="{$smarty.const.WWW_TOP}/movies?year={$result.year}">{$result.year}</a>)</h2>
				{if $result.tagline != ''}<b>{$result.tagline}</b><br />{/if}
				{if $result.plot != ''}{$result.plot}<br /><br />{/if}
				{if $result.genre != ''}<b>Genre:</b> {$result.genre}<br />{/if}
				{if $result.director != ''}<b>Director:</b> {$result.director}<br />{/if}
				{if $result.actors != ''}<b>Starring:</b> {$result.actors}<br />{/if}
				<b>Rating:</b>
				{if $result.rating == ''}N/A{else}{$result.rating}/10 
					<div class="progress progress-striped" style="width:150px">
						<div class="bar" style="width: {$result.rating * 10}%;"></div>
					</div> 
				{/if}
				<div class="movextra">
					<table class="table table-hover">
						{assign var="msplits" value=","|explode:$result.grp_release_id}
						{assign var="mguid" value=","|explode:$result.grp_release_guid}
						{assign var="mnfo" value=","|explode:$result.grp_release_nfoID}
						{assign var="mgrp" value=","|explode:$result.grp_release_grpname}
						{assign var="mname" value="#"|explode:$result.grp_release_name}
						{assign var="mpostdate" value=","|explode:$result.grp_release_postdate}
						{assign var="msize" value=","|explode:$result.grp_release_size}
						{assign var="mtotalparts" value=","|explode:$result.grp_release_totalparts}
						{assign var="mcomments" value=","|explode:$result.grp_release_comments}
						{assign var="mgrabs" value=","|explode:$result.grp_release_grabs}
						{assign var="mpass" value=","|explode:$result.grp_release_password}
						{assign var="minnerfiles" value=","|explode:$result.grp_rarinnerfilecount}
						{assign var="mhaspreview" value=","|explode:$result.grp_haspreview}
						{foreach from=$msplits item=m}
						<tr id="guid{$mguid[$m@index]}" {if $m@index > 1}class="mlextra"{/if}>
							<td>
								<div class="icon"><input type="checkbox" class="nzb_check" value="{$mguid[$m@index]}" /></div>							
							</td>
							<td>
								<a href="{$smarty.const.WWW_TOP}/details/{$mguid[$m@index]}/{$mname[$m@index]|escape:"seourl"}">{$mname[$m@index]|escape:"htmlall"}</a>
								<div>
								Posted {$mpostdate[$m@index]|timeago},  {$msize[$m@index]|fsize_format:"MB"},  <a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$mguid[$m@index]}">{$mtotalparts[$m@index]} files</a>, 
                  <span{if $mcomments[$m@index] < 1} style="opacity:0.2;"{/if}><a title="View comments" href="{$smarty.const.WWW_TOP}/details/{$mguid[$m@index]}/#comments">{writhem_browse_comment_count guid=$mguid[$m@index]}<i class="icon-comment"></i></a></span>, 
                  <span{if $mgrabs[$m@index] < 1} style="opacity:0.2;"{/if}>{$mgrabs[$m@index]}<i class="icon-download"></i></span>,								
								{if $mnfo[$m@index] > 0}<a href="{$smarty.const.WWW_TOP}/nfo/{$mguid[$m@index]}" title="View Nfo" class="modal_nfo" rel="nfo">Nfo</a>, {/if}
								{if $mpass[$m@index] == 1}Passworded, {elseif $mpass[$m@index] == 2}Potential Password, {/if}
								<a href="{$smarty.const.WWW_TOP}/browse?g={$mgrp[$m@index]}" title="Browse releases in {$mgrp[$m@index]|replace:"alt.binaries":"a.b"}">Grp</a>
								{if $mhaspreview[$m@index] == 1 && $userdata.canpreview == 1}, <a href="{$smarty.const.WWW_TOP}/covers/preview/{$mguid[$m@index]}_thumb.jpg" name="name{$mguid[$m@index]}" title="View Screenshot" class="modal_prev" rel="preview">Preview</a>{/if}
								{if $minnerfiles[$m@index] > 0}, <a href="#" onclick="return false;" class="mediainfo" title="{$mguid[$m@index]}">Media</a>{/if}
								</div>
							</td>
							<td class="icons">
								<div class="icon icon_nzb"><a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$mguid[$m@index]}/{$mname[$m@index]|escape:"url"}">&nbsp;</a></div>
								<div class="icon icon_cart" title="{$themevars.cart_name_add}"></div>
								{if $sabintegrated}<div class="icon icon_sab" title="Send to my Sabnzbd"></div>{/if}
							</td>
						</tr>
						{if $m@index == 1 && $m@total > 2}
							<tr><td colspan="5"><a class="mlmore" href="#">{$m@total-2} more...</a></td></tr>
						{/if}
						{/foreach}		
					</table>
				</div>
			</td>
		</tr>
	{/foreach}
</table>

<br/>

  <table width="100%">
    <tr>
      <td>{$pager}</td>
      <td style="text-align:right"><div class="nzb_multi_operations">
        <small>With selected:</small>
        <div class="btn-group">
        <button type="button" class="btn btn-mini nzb_multi_operations_download"><i class="icon-download"></i> Download NZBs</button>
        <button type="button" class="btn btn-mini nzb_multi_operations_cart"><i class="{$themevars.cart_icon}"></i> {$themevars.cart_name_add}</button>
        {if $sabintegrated}<button type="button" class="btn btn-mini nzb_multi_operations_sab"><i class="icon-download-alt"></i> Send to SAB</button>{/if}
        {if $userdata.admin}
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

</form>

{/if}

<br/><br/><br/>
