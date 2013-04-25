
<h1>{$release.searchname|escape:"htmlall"}</h1>

{if $site->addetail != ""}
<table class="adblock" cellspacing="0" cellpadding="0"><tr><td>{$site->addetail}</td></tr></table><br />
{/if}


<!-- group/etc -->
<span class="label">
    <a style="color:white" title="Browse by {$release.category_name}" href="{$smarty.const.WWW_TOP}/browse?t={$release.categoryID}">{$release.category_name}</a>
</span>
<span class="label">
    <a style="color:white" title="Browse {$release.group_name}" href="{$smarty.const.WWW_TOP}/browse?g={$release.group_name}">{$release.group_name|replace:"alt.binaries":"a.b"}</a>
</span>
{if $predb}
    {if $predb.nuketype != '' && $predb.nukereason != ''}
		<span class="badge label-warning">
			<!--<tr><th>Pre:</th><td>{$predb.ctime|date_format:"%b %e, %Y %T"} ({$predb.ctime|daysago})</td></tr>-->
			<i class="icon-warning-sign icon-white"></i> 
            {if preg_match('/^(UN)?((MOD)?NUKED?|DELPRE|MOD|LOCAL)$/', $predb.nuketype)}
                {$predb.nuketype}NUKE:{$predb.nukereason}
            {else}
                {$predb.nukereason} [{$predb.nuketype}]
            {/if}
		</span>
	{/if}
{/if}
{if $site->checkpasswordedrar > 0 && $release.passwordstatus > 0}
    <span class="badge label-warning"><i class="icon-lock icon-white"></i> {if $release.passwordstatus == 2}Passworded Rar Archive{elseif $release.passwordstatus == 1}Contains Cab/Ace/Rar Inside Archive{else}Unknown{/if}
    </span>
{/if}

{foreach from=$reAudio item=audio}
	{if $audio.audiolanguage != ""}
		<i class="icon-flag {$audio.audioflag}" title="{$audio.audiolanguage}-{$audio.audioformat}"></i>
	{/if}
{/foreach}
<br />

  <table>
  <tr id="guid{$release.guid}"><th>Download:</th><td>
    <div class="icon icon_nzb"><a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$release.guid}/{$release.searchname|escape:"url"}">&nbsp;</a></div>
    <div class="icon icon_cart" title="{$themevars.cart_name_add}"></div>
    {if $sabintegrated}<div class="icon icon_sab" title="Send to my Sabnzbd"></div>{/if}
  </td>
  </table>

<!-- ### -- IMAGE ON RIGHT -->
{if $rage && $release.rageID > 0 && $rage.imgdata != ""}<img class="img-rounded" src="{$smarty.const.WWW_TOP}/getimage?type=tvrage&amp;id={$rage.ID}" width="180" height="auto" alt="{$rage.releasetitle|escape:"htmlall"}" style="float:right;" />{/if}
{if $movie && $release.rageID < 0 && $movie.cover == 1}<img class="img-rounded" src="{$smarty.const.WWW_TOP}/covers/movies/{$movie.imdbID}-cover.jpg" width="180" height="auto" alt="{$movie.title|escape:"htmlall"}" style="float:right;" />{/if}
{if $anidb && $release.anidbID > 0 && $anidb.picture != ""}<img class="img-rounded" src="{$smarty.const.WWW_TOP}/covers/anime/{$anidb.anidbID}.jpg" width="180" alt="{$anidb.title|escape:"htmlall"}" style="float:right;" />{/if}
{if $con && $con.cover == 1}<img class="img-rounded" src="{$smarty.const.WWW_TOP}/covers/console/{$con.ID}.jpg" width="160" alt="{$con.title|escape:"htmlall"}" style="float:right;" />{/if}
{if $music && $music.cover == 1}<img class="img-rounded" src="{$smarty.const.WWW_TOP}/covers/music/{$music.ID}.jpg" width="160" alt="{$music.title|escape:"htmlall"}" style="float:right;" />{/if}
{if $book && $book.cover == 1}<img class="img-rounded" src="{$smarty.const.WWW_TOP}/covers/book/{$book.ID}.jpg" width="160" alt="{$book.title|escape:"htmlall"}" style="float:right;" />{/if}

<!-- ### -- MEDIA DESCRIPTION -->
{if $rage && $release.rageID > 0}
    <!-- TV Info -->
    <strong>{if $release.tvtitle != ""}{$release.tvtitle|escape:"htmlall"} - {/if}{$release.seriesfull|replace:"S":"Season "|replace:"E":" Episode "}</strong><br />
    {if $rage.description != ""}<span class="descinitial">{$rage.description|escape:"htmlall"|nl2br|magicurl|truncate:"350":"</span><a class=\"descmore\" href=\"#\">more...</a>"}{if $rage.description|strlen > 350}<span class="descfull">{$rage.description|escape:"htmlall"|nl2br|magicurl}</span>{else}{/if}<br /><br />{/if}
    {if $rage.genre != ""}<strong>Genre:</strong> {$rage.genre|escape:"htmlall"|replace:"|":", "}<br />{/if}
    {if $release.tvairdate != ""}<strong>Aired:</strong> {$release.tvairdate|date_format}<br/>{/if}
    {if $rage.country != ""}<strong>Country:</strong> {$rage.country}<br/>{/if}
    {if $episode && $release.episodeinfoID > 0}
        {if $episode.overview != ""}<strong>Overview:</strong> <span class="descinitial">{$episode.overview|escape:"htmlall"|nl2br|magicurl|truncate:"350":"</span><a class=\"descmore\" href=\"#\">more...</a>"}{if $episode.overview|strlen > 350}<span class="descfull">{$episode.overview|escape:"htmlall"|nl2br|magicurl}</span>{else}{/if}<br /><br />{/if}
        {if $episode.rating > 0}<strong>Rating:</strong> {$episode.rating}/10 <div class="progress progress-striped" style="width:150px">
                                                            <div class="bar" style="width: {$episode.rating * 10}%;"></div>
        </div> {/if}
        {if $episode.director != ""}<strong>Director:</strong> {$episode.director|escape:"htmlall"|replace:"|":", "}{/if}
        {if $episode.writer != ""}<strong>Writer:</strong> {$episode.writer|escape:"htmlall"|replace:"|":", "}{/if}
        {if $episode.gueststars != ""}<strong>Guest Stars:</strong> {$episode.gueststars|escape:"htmlall"|replace:"|":", "}{/if}
    {/if}<br /><div class="btn-group">
    <a class="btn btn-mini" title="View all episodes from this series" href="{$smarty.const.WWW_TOP}/series/{$release.rageID}">All Episodes</a> 
    <a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}http://www.tvrage.com/shows/id-{$release.rageID}" title="View at TV Rage">TV Rage</a>
    {if $release.tvdbID > 0}<a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}http://thetvdb.com/?tab=series&id={$release.tvdbID}&lid=7" title="View at TheTVDB">TheTVDB</a>{/if}
    <a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/rss?rage={$release.rageID}&amp;dl=1&amp;i={$userdata.ID}&amp;r={$userdata.rsstoken}" title="Rss feed for this series">Series Rss Feed</a></div>
{/if}
{if $movie && $release.rageID < 0}
    <!-- Movie Info -->
    <strong>{$movie.title|escape:"htmlall"} ({$movie.year})</strong>
    {if $movie.tagline != ''}<br />{$movie.tagline|escape:"htmlall"}{/if}
    {if $movie.plot != ''}{if $movie.tagline != ''} - {else}<br />{/if}{$movie.plot|escape:"htmlall"}{/if}
    <br /><br />{if $movie.director != ""} <strong>Director:</strong> {$movie.director}<br />{/if}
    <strong>Genre:</strong> {$movie.genre}
    <br /><strong>Starring:</strong> {$movie.actors}<br />
	<strong>Rating:</strong>
	{if $movie.rating == ''}N/A{else}{$movie.rating}/10 
	<div class="progress progress-striped" style="width:150px">
		<div class="bar" style="width: {$movie.rating * 10}%;"></div>
	</div> {/if}    
	<div class="btn-group">
        <a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}http://www.imdb.com/title/tt{$release.imdbID}/" title="View at IMDB">IMDB</a>
        {if $movie.tmdbID != ''}<a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}http://www.themoviedb.org/movie/{$movie.tmdbID}" title="View at TMDb">TMDb</a>{/if}
        <a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/movies?imdb={$release.imdbID}" title="View all versions">Movie View</a>
    </div>

{/if}
{if $anidb && $release.anidbID > 0}
    <!-- ANIME INFO -->
    <strong>{if $release.tvtitle != ""}{$release.tvtitle|escape:"htmlall"}{/if}</strong><br />
			{if $anidb.description != ""}<span class="descinitial">{$anidb.description|escape:"htmlall"|nl2br|magicurl|truncate:"350":"</span><a class=\"descmore\" href=\"#\">more...</a>"}{if $anidb.description|strlen > 350}<span class="descfull">{$anidb.description|escape:"htmlall"|nl2br|magicurl}</span>{else}{/if}<br /><br />{/if}
			{if $anidb.categories != ""}<strong>Categories:</strong> {$anidb.categories|escape:"htmlall"|replace:"|":", "}<br />{/if}
			{if $release.tvairdate != "0000-00-00 00:00:00"}<strong>Aired:</strong> {$release.tvairdate|date_format}<br/>{/if}
			{if $episode && $release.episodeinfoID > 0}
				{if $episode.overview != ""}<strong>Overview:</strong> {$episode.overview}{/if}
				{if $episode.rating > 0}<strong>Rating:</strong> {$episode.rating}{/if}
				{if $episode.director != ""}<strong>Director:</strong> {$episode.director|escape:"htmlall"|replace:"|":", "}{/if}
				{if $episode.gueststars != ""}<strong>Guest Stars:</strong> {$episode.gueststars|escape:"htmlall"|replace:"|":", "}{/if}
				{if $episode.writer != ""}<strong>Writer:</strong> {$episode.writer|escape:"htmlall"|replace:"|":", "}{/if}
			{/if}<br /><br />
    <div class="btn-group">
        <a class="btn btn-mini" title="View all episodes from this anime" href="{$smarty.const.WWW_TOP}/anime/{$release.anidbID}">All Episodes</a> 
        <a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}http://anidb.net/perl-bin/animedb.pl?show=anime&aid={$anidb.anidbID}" title="View at AniDB">AniDB</a>
        {if $release.tvdbID > 0}<a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}http://thetvdb.com/?tab=series&id={$release.tvdbID}&lid=7" title="View at TheTVDB">TheTVDB</a>{/if}
        <a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/rss?anidb={$release.anidbID}&amp;dl=1&amp;i={$userdata.ID}&amp;r={$userdata.rsstoken}" title="RSS feed for this anime">Anime RSS Feed</a>
    </div>
{/if}
{if $con}
    <!-- Console Info -->
    {$con.title|escape:"htmlall"} ({$con.releasedate|date_format:"%Y"})
    {if $con.review != ""}{$con.review|escape:"htmlall"|nl2br|magicurl|truncate:"350":"more..."}{if $con.review|strlen > 350}{$con.review|escape:"htmlall"|nl2br|magicurl}{else}{/if}

    {/if} {if $con.esrb != ""}ESRB: {$con.esrb|escape:"htmlall"}
    {/if} {if $con.genres != ""}Genre: {$con.genres|escape:"htmlall"}
    {/if} {if $con.publisher != ""}Publisher: {$con.publisher|escape:"htmlall"}
    {/if} {if $con.platform != ""}Platform: {$con.platform|escape:"htmlall"}
    {/if} {if $con.releasedate != ""}Released: {$con.releasedate|date_format}{/if} {if $con.url != ""} Amazon 

    {/if}
{/if}
{if $book}
    <!-- Book info -->
    <strong>{$book.author|escape:"htmlall"} - {$book.title|escape:"htmlall"}</strong><br />
    {if $book.review != ""}<span class="descinitial">{$book.review|escape:"htmlall"|nl2br|magicurl|truncate:"350":"</span><a class=\"descmore\" href=\"#\">more...</a>"}{if $book.review|strlen > 350}<span class="descfull">{$book.review|escape:"htmlall"|nl2br|magicurl}</span>{else}{/if}<br /><br />{/if}
    {if $book.ean != ""}<strong>EAN:</strong> {$book.ean|escape:"htmlall"}<br />{/if}
    {if $book.isbn != ""}<strong>ISBN:</strong> {$book.isbn|escape:"htmlall"}<br />{/if}
    {if $book.pages != ""}<strong>Pages:</strong> {$book.pages|escape:"htmlall"}<br />{/if}
    {if $book.dewey != ""}<strong>Dewey:</strong> {$book.dewey|escape:"htmlall"}<br />{/if}
    {if $book.publisher != ""}<strong>Publisher:</strong> {$book.publisher|escape:"htmlall"}<br />{/if}
    {if $book.publishdate != ""}<strong>Publish Date:</strong> {$book.publishdate|date_format}{/if}
    {if $book.url != ""}<br /><br />
        <a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}{$book.url}/" title="View book at Amazon">Amazon</a>
    {/if}
{/if}
{if $music}
    <!-- Music Info -->
    <strong>{$music.title|escape:"htmlall"} {if $music.year != ""}({$music.year}){/if}</strong><br />
    {if $music.review != ""}<span class="descinitial">{$music.review|nl2br|magicurl|truncate:"350":"</span><a class=\"descmore\" href=\"#\">more...</a>"}{if $music.review|strlen > 350}<span class="descfull">{$music.review|escape:"htmlall"|nl2br|magicurl}</span>{else}{/if}<br /><br />{/if}
    {if $music.genres != ""}<strong>Genre:</strong> {$music.genres|escape:"htmlall"}<br />{/if}
    {if $music.publisher != ""}<strong>Publisher:</strong> {$music.publisher|escape:"htmlall"}<br />{/if}
    {if $music.releasedate != ""}<strong>Released:</strong> {$music.releasedate|date_format}<br />{/if}
    {if $music.tracks != ""}
        <strong>Track Listing:</strong>
        <ol class="tracklist">
            {assign var="tracksplits" value="|"|explode:$music.tracks}
            {foreach from=$tracksplits item=tracksplit}
            <li>{$tracksplit|trim|escape:"htmlall"}</li>
            {/foreach}		
        </ol>
	{/if}   
    {if $music.url != ""} <br /><br />
        <a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}{$music.url}/" title="View record at Amazon">Amazon</a>
    {/if}

{/if}
<br /><br />
<!-- NAV-TAB PILLS -->
<ul class="nav nav-tabs">
	<li class="active"><a href="#details" data-toggle="tab" style="color: black;"><i class="icon-time"></i> Details</a></li>
	{if $reVideo.releaseID|@count > 0 || $reAudio|@count > 0}
		<li><a href="#mediainfo" data-toggle="tab" style="color: black;"><i class="icon-info-sign"></i> Media Info</a></li>
	{/if}
	{if $nfo.ID|@count > 0}
	<li><a href="#viewnfo" data-toggle="tab" style="color: black;"><i class="icon-file"></i> View NFO</a></li>
	{/if}
	<li><a href="#fileinfo" data-toggle="tab" style="color: black;"><i class="icon-folder-open"></i> File Info</a></li>
	{if ($release.haspreview == 1 && $userdata.canpreview == 1) || ($release.haspreview == 2 && $userdata.canpreview == 1)}
		<li><a href="#preview" data-toggle="tab" style="color: black;"><i class="icon-picture"></i> Preview</a></li>
	{/if}
	{if $isadmin}
		<li><a href="#admin" data-toggle="tab" style="color: black;"><i class="icon-font"></i> Admin Info</a></li>
	{/if}
</ul>

<div class="tab-content">
	<div class="tab-pane active" id="details">
		<table class="table " id="detailstable" >			
			<tr><th>Group:</th><td title="{$release.group_name}"><a title="Browse {$release.group_name}" href="{$smarty.const.WWW_TOP}/browse?g={$release.group_name}">{$release.group_name|replace:"alt.binaries":"a.b"}</a></td></tr>
			<tr><th>Category:</th><td><a title="Browse by {$release.category_name}" href="{$smarty.const.WWW_TOP}/browse?t={$release.categoryID}">{$release.category_name}</a></td></tr>
			<tr><th>Size:</th><td>{$release.size|fsize_format:"MB"}{if $release.completion > 0}&nbsp;({if $release.completion < 100}<span class="warning">{$release.completion}%</span>{else}{$release.completion}%{/if}){/if}</td></tr>
			<tr><th>Grabs:</th><td>{$release.grabs} time{if $release.grabs==1}{else}s{/if}</td></tr>
      {if $release.name != $release.searchname}
        <tr><th>Original Name:</th><td title="{$release.name}">{$release.name}</td></tr>
      {/if}
			<tr><th>Poster:</th><td>{$release.fromname|escape:"htmlall"}</td></tr>
            {if $predb}
                <tr><th>Pre:</th><td>{$predb.ctime|date_format:"%b %e, %Y %T"} ({$predb.ctime|daysago})</td></tr>
                {if $predb.nuketype != '' && $predb.nukereason != '' && $predb.nuketime != 0}
                    <tr><th>Nuked:</th><td>{$predb.nuketime|date_format:"%b %e, %Y %T"} ({$predb.nuketime|daysago})</td></tr>
                {/if}
            {/if}			
            <tr><th>Posted:</th><td title="{$release.postdate}">{$release.postdate|date_format:"%b %e, %Y %T"} ({$release.postdate|daysago})</td></tr>
			<tr><th>Added:</th><td title="{$release.adddate}">{$release.adddate|date_format:"%b %e, %Y %T"} ({$release.adddate|daysago})</td></tr>
			<tr id="guid{$release.guid}"><th>Download:</th><td>
				<div class="icon icon_nzb"><a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$release.guid}/{$release.searchname|escape:"url"}">&nbsp;</a></div>
				<div class="icon icon_cart" title="{$themevars.cart_name_add}"></div>
				{if $sabintegrated}<div class="icon icon_sab" title="Send to my Sabnzbd"></div>{/if}
			</td></tr>
			<tr>
				<th>Similar:</th>
				<td>
					<a title="Search for similar Nzbs" href="{$smarty.const.WWW_TOP}/search/{$searchname|escape:"url"}">Search for similar</a><br/>
				</td>
			</tr>

		</table>
	</div>
	{if $reVideo.releaseID|@count > 0 || $reAudio|@count > 0}
	<div class="tab-pane" id="mediainfo">
		<table style="width:100%;" class="table table-bordered table-hover">
			<tr>
				<th width="15%"></th>
				<th>Property</th>
				<th class="right">Value</th>
			</tr>
			{if $reVideo.containerformat != ""}
			<tr>
				<td style="width:15%;"><strong>Overall</strong></td>
				<td>Container Format</td>
				<td class="right">{$reVideo.containerformat}</td>
			</tr>
			{/if}
			{if $reVideo.overallbitrate != ""}
			<tr>
				<td></td>
				<td>Bitrate</td>
				<td class="right">{$reVideo.overallbitrate}</td>
			</tr>
			{/if}
			{if $reVideo.videoduration != ""}
			<tr>
				<td><strong>Video</strong></td>
				<td>Duration</td>
				<td class="right">{$reVideo.videoduration}</td>
			</tr>				
			{/if}
			{if $reVideo.videoformat != ""}
			<tr>
				<td></td>
				<td>Format</td>
				<td class="right">{$reVideo.videoformat}</td>
			</tr>
			{/if}
			{if $reVideo.videocodec != ""}
			<tr>
				<td></td>
				<td>Codec</td>
				<td class="right">{$reVideo.videocodec}</td>
			</tr>
			{/if}
			{if $reVideo.videowidth != "" && $reVideo.videoheight != ""}
			<tr>
				<td></td>
				<td>Width x Height</td>
				<td class="right">{$reVideo.videowidth}x{$reVideo.videoheight}</td>
			</tr>
			{/if}
			{if $reVideo.videoaspect != ""}
			<tr>
				<td></td>
				<td>Aspect</td>
				<td class="right">{$reVideo.videoaspect}</td>
			</tr>				
			{/if}
			{if $reVideo.videoframerate != ""}
			<tr>
				<td></td>
				<td>Framerate</td>
				<td class="right">{$reVideo.videoframerate} fps</td>
			</tr>	
			{/if}
			{if $reVideo.videolibrary != ""}
			<tr>
				<td></td>
				<td>Library</td>
				<td class="right">{$reVideo.videolibrary}</td>
			</tr>
			{/if}
			{foreach from=$reAudio item=audio}
			<tr>
				<td><strong>Audio {$audio.audioID}</strong></td>
				<td>Format</td>
				<td class="right">{$audio.audioformat}</td>
			</tr>
			{if $audio.audiolanguage != ""}
			<tr>
				<td></td>
				<td>Language</td>
				<td class="right">{$audio.audiolanguage}</td>
			</tr>					
			{/if}
			{if $audio.audiotitle != ""}
			<tr>
				<td></td>
				<td>Title</td>
				<td class="right">{$audio.audiotitle}</td>
			</tr>					
			{/if}						
			{if $audio.audiomode != ""}
			<tr>
				<td></td>
				<td>Mode</td>
				<td class="right">{$audio.audiomode}</td>
			</tr>		
			{/if}
			{if $audio.audiobitratemode != ""}
			<tr>
				<td></td>
				<td>Bitrate Mode</td>
				<td class="right">{$audio.audiobitratemode}</td>
			</tr>					
			{/if}
			{if $audio.audiobitrate != ""}
			<tr>
				<td></td>
				<td>Bitrate</td>
				<td class="right">{$audio.audiobitrate}</td>
			</tr>	
			{/if}
			{if $audio.audiochannels != ""}
			<tr>
				<td></td>
				<td>Channels</td>
				<td class="right">{$audio.audiochannels}</td>
			</tr>	
			{/if}
			{if $audio.audiosamplerate != ""}
			<tr>
				<td></td>
				<td>Sample Rate</td>
				<td class="right">{$audio.audiosamplerate}</td>
			</tr>	
			{/if}
			{if $audio.audiolibrary != ""}
			<tr>
				<td></td>
				<td>Library</td>
				<td class="right">{$audio.audiolibrary}</td>
			</tr>					
			{/if}		
			{/foreach}
			{if $reSubs.subs != ""}
			<tr>
				<td><strong>Subtitles</strong></td>
				<td>Languages</td>
				<td class="right">{$reSubs.subs|escape:"htmlall"}</td>
			</tr>					
			{/if}
		</table>

	</div>
	{/if}
	{if $nfo.ID|@count > 0}
	<div class="tab-pane" id="viewnfo">
	</div>
	{/if}
	<div class="tab-pane" id="fileinfo">
		<table class="table table-bordered" id="detailstable" >		
			{if $site->checkpasswordedrar > 0}
				<tr><th>Password:</th>
					<td>
						{if $release.passwordstatus == 0}None{elseif $release.passwordstatus == 2}Passworded Rar Archive{elseif $release.passwordstatus == 1}Contains Cab/Ace/Rar Inside Archive{else}Unknown{/if}
					</td>
				</tr>
			{/if}			
		{if $releasefiles|@count > 0}
			<tr><th>Rar Contains:</th>
				<td style="padding:0px;">
					<table style="width:100%;" class="table table-striped">
					<tr>
						<th>Filename</th>
						<th class="mid">Password</th>
						<th class="mid">Size</th>
						<th class="mid">Date</th>
					</tr>
					{foreach from=$releasefiles item=rf}
					<tr>
						<td>{$rf.name}</td>
						<td class="mid">{if $rf.passworded != 1}No{else}Yes{/if}</td>
						<td class="right">{$rf.size|fsize_format:"MB"}</td>
						<td title="{$rf.createddate}" class="right" >{$rf.createddate|date_format}</td>
					</tr>
					{/foreach}
					</table>
				</td>
			</tr>
			{/if}
			<tr><th>Files:</th>
				<td>
					<div id="viewfiles_btn">
						<button class="btn btn-mini" onclick="$('#viewfiles').load('{$smarty.const.WWW_TOP}/filelist/{$release.guid}&modal'),jQuery('#viewfiles_btn').toggle();">View {$release.totalpart} file{if $release.totalpart==1}{else}s{/if}</button>
					</div>
					<div id="viewfiles">
					</div>
					<a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$release.guid}"></a>
				</td>
			</tr>
		</table>
	</div>
	{if $release.haspreview == 1 && $userdata.canpreview == 1}
	<div class="tab-pane" id="preview">
		<img class="img-rounded" width="770" src="{$smarty.const.WWW_TOP}/covers/preview/{$release.guid}_thumb.jpg" alt="{$release.searchname|escape:"htmlall"} screenshot" />
	</div>
	{/if}
	{if $release.haspreview == 2 && $userdata.canpreview == 1}
	<div class="tab-pane" id="preview">
		<a href="#" name="audio{$release.guid}" title="Listen to {$release.searchname|escape:"htmlall"}" class="audioprev btn" rel="audio">Listen</a><audio id="audprev{$release.guid}" src="{$smarty.const.WWW_TOP}/covers/audio/{$release.guid}.mp3" preload="none"></audio>
	</div>
	{/if}

	{if $isadmin}
	<div class="tab-pane" id="admin">

		<table class="table table-bordered" id="detailstable" >			
			<tr><th>Actions:</th>
				<td><div class="btn-group">
					<a class="btn btn-mini btn-inverse" href="{$smarty.const.WWW_TOP}/admin/release-edit.php?id={$release.ID}&amp;from={$smarty.server.REQUEST_URI}" title="Edit Release"><i class="icon-edit icon-white"></i> Edit</a> 
					<a class="btn btn-mini btn-inverse" href="{$smarty.const.WWW_TOP}/admin/release-delete.php?id={$release.ID}&amp;from={$smarty.server.HTTP_REFERER}" title="Delete Release"><i class="icon-trash icon-white"></i> Delete</a>
				</div></td>
			</tr>
			<tr><th>Release Info:</th>
				<td>
					Regex Id (<a href="{$smarty.const.WWW_TOP}/admin/regex-list.php#{$release.regexID}">{$release.regexID}</a>) <br/> 
					{if $release.reqID != ""}
						Request Id ({$release.reqID})
					{/if}
				</td>
			</tr>
			<tr><th width="110px">Nuke This Release:</th>
				<td>
                    <a class="btn btn-mini btn-inverse" data-toggle="button" id="lnkNukeIt" onclick="jQuery('#divNukeIt').toggle();"><i class="icon-warning-sign icon-white"></i> Nuke It!</a><br />
                    <div style="display:none;" id="divNukeIt">
                        <form id="frmNukeIt" method="GET">
                            <input type="hidden" id="txtGUID" value="{$release.guid}"/>
                            <div class="input-prepend">
                                <span class="add-on"><label for="txtDirName">DirName</label></span>
                                <input class="span3" type="text" id="txtDirName" value="{$release.searchname|escape:'htmlall'}" required/>
                            </div>
                            <div class="input-prepend">
                                <span class="add-on"><label for="txtCategory">Category</label></span>
                                <input class="span3" type="text" id="txtCategory" required/>
                            </div>
                            <div class="input-prepend">
                                <span class="add-on"><label for="txtReason">Reason</label></span>
                                <input class="span3" type="text" id="txtReason"/>
                            </div>
                            <div class="input-prepend">
                                <span class="add-on"><label for="txtScope">Scope</label></span>
                                <input class="span3" type="text" id="txtScope" value="LOCAL"/>
                            </div>
                            <button class="btn btn-inverse" type="submit">Detonate!</button>
                        </form>
                    </div>
                    <span title="We successfully did a local Nuke" class="nukeitsuccess" id="divNukeItSuccess" style="display:none;">Aquiring Target...</span>
                    <span class="nukeitfail" id="divNukeItFail" style="display:none;">Whoops: Something went wrong, Batman!</span>

                </td>
			</tr>
		</table>
	</div>
	{/if}
</div>
 
<div class="comments">
	<a id="comments"></a>
	<h2><i class="icon-comment"></i> Comments</h2>
	
	{if $comments|@count > 0}
	
		<table style="margin-bottom:20px;" class="table table-striped Sortable">
			<tr class="{cycle values=",alt"}">
			<th width="80">User</th>
			<th>Comment</th>
			</tr>

		{foreach from=$comments|@array_reverse:true item=comment}
			<tr>
				<td class="less" title="{$comment.createddate}">
          {if $comment.sourceid == 0}
            {if $comment.role == 2}<i class="icon-font" title="{$comment.rolename}"></i>
            {elseif $comment.role == 4}<i class="icon-certificate" title="{$comment.rolename}"></i>
            {else}<i class="icon-user" title="Normal User"></i>
            {/if}
            {if $comment.role == 2}<strong>{/if}
            <a title="View {$comment.username}'s profile" href="{$smarty.const.WWW_TOP}/profile?name={$comment.username}">{$comment.username}</a>
            {if $comment.role == 2}</strong>{/if}
          {else}
            {if $isadmin}
             <i class="icon-globe" title="{$comment.rolename}"></i> {$comment.username} @<a href="{$smarty.const.WWW_TOP}/admin/spotnab-edit.php?id={$comment.sourceid}">{writhem_spotnab_name id=$comment.sourceid}</a>
            {else}
             <i class="icon-globe" title="{$comment.rolename}"></i> {$comment.username}
            {/if}
          {/if}
            <br/>{$comment.createddate|daysago}
        </td>
				<td>{$comment.text|escape:"htmlall"|nl2br}</td>
			</tr>
		{/foreach}
		</table>
	
	{/if}
	
	<form action="" method="post">
		<label for="txtAddComment">Add Comment:</label><br/>
		<textarea id="txtAddComment" name="txtAddComment" rows="6" cols="60"></textarea>
		<br/>
		<input class="btn" type="submit" value="Submit"/>
	</form>

</div>

{if $nfo.ID|@count > 0}
<script>
	// nfo loader
 	$(document).ready(function() {
		$('#viewnfo').load('{$smarty.const.WWW_TOP}/nfo/{$release.guid}&modal', function() {
			$('.tabs').tab('show'); //reinitialize tabs
		});

		$('.tabs').bind('change', function(e) {
			var pattern=/#.+/gi //set a regex pattern (all the things after "#").
			var contentID = e.target.toString().match(pattern)[0]; //find pattern

			$(contentID).load('/'+contentID.replace('#',''), function(){
				$('.tabs').tabs(); //reinitialize tabs
			});
		});	
	});
</script>
{/if}
