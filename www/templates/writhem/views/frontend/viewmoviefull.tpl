{if $results|@count > 0}

	{foreach from=$results item=result}
		
		<div id="moviefull" style="min-height:340px;">
		{if $result.cover == 1}<img class="shadow pic img-polaroid pull-right" style="margin-right:50px;" alt="{$result.title|escape:"htmlall"} Logo" src="{$smarty.const.WWW_TOP}/covers/movies/{$result.imdbID}-cover.jpg" />{/if}
		

		<h2 style="display:inline;">{$result.title|escape:"htmlall"} ({$result.year})</h2>    <a class="rndbtn badge badge-imdb" target="_blank" href="{$site->dereferrer_link}http://www.imdb.com/title/tt{$result.imdbID}/" name="imdb{$result.imdbID}" title="View imdb page">Imdb</a>
		
		<h4>{if $result.genre != ''}{$result.genre|replace:"|":" / "}{/if}</h4>
		
		
		{if $result.tagline != ''}
			<p class="lead" style="margin-right:300px;">"{$result.tagline|escape:"htmlall"}"</p>
		{/if}
		
		
		<dl style="margin-right:300px;">
			{if $result.plot != ''}
				<dt>Plot</dt>
				<dd>{$result.plot|escape:"htmlall"}</dd>
			{/if}
			{if $result.rating != ''}
				<dt>Rating</dt>
				<dd>{$result.rating}/10 {if $result.ratingcount != ''}({$result.ratingcount|number_format} votes)</dd>{/if}
			{/if}
			{if $result.director != ''}
				<dt>Director</dt> 
				<dd>{$result.director|replace:"|":", "}</dd>
			{/if}
			{if $result.actors != ''}
				<dt>Actors</dt> 
				<dd>{$result.actors|replace:"|":", "}</dd>
			{/if}
		</dl>
		
		
		</div>
		
		<form id="nzb_multi_operations_form" action="get">
			<div class="nzb_multi_operations">
				{if $section != ''}View: <a href="{$smarty.const.WWW_TOP}/{$section}?t={$category}">Covers</a> | <b>List</b><br />{/if}
				With Selected:
				<div class="btn-group pull-right">
					<input type="button" class="nzb_multi_operations_download btn btn-mini" value="Download NZBs" />
					<input type="button" class="nzb_multi_operations_cart btn btn-mini" value="{$themevars.cart_name_add}" />
					{if $sabintegrated}<input type="button" class="nzb_multi_operations_sab btn btn-mini" value="Send to SAB" />{/if}
          {if $isadmin}
              <input type="button" class="nzb_multi_operations_edit btn btn-mini btn-inverse" value="Edit" />
              <input type="button" class="nzb_multi_operations_delete btn btn-mini btn-inverse" value="Delete" />
          {/if}	
				</div>

			</div>
		

		<table style="width:100%;" class="data highlight icons table table-bordered table-striped" id="browsetable">
			<tr>
				<th>
					<input id="chkSelectAll" type="checkbox" class="nzb_check_all" />
					<label for="chkSelectAll" style="display:none;">Select All</label>
				</th>

				<th>name<br/>
					<a title="Sort Descending" href="{$orderbyname_desc}">
						<i class="fa-icon-caret-down"></i>
					</a>
					<a title="Sort Ascending" href="{$orderbyname_asc}">
						<i class="fa-icon-caret-up"></i>
					</a>
				</th>

				<th>category<br/>
					<a title="Sort Descending" href="{$orderbycat_desc}">
						<i class="fa-icon-caret-down"></i>
					</a>
					<a title="Sort Ascending" href="{$orderbycat_asc}">
						<i class="fa-icon-caret-up"></i>
					</a>
				</th>

				<th>posted<br/>
					<a title="Sort Descending" href="{$orderbyposted_desc}">
						<i class="fa-icon-caret-down"></i>
					</a>
					<a title="Sort Ascending" href="{$orderbyposted_asc}">
						<i class="fa-icon-caret-up"></i>
					</a>
				</th>

				<th>size<br/>
					<a title="Sort Descending" href="{$orderbysize_desc}">
						<i class="fa-icon-caret-down"></i>
					</a>
					<a title="Sort Ascending" href="{$orderbysize_asc}">
						<i class="fa-icon-caret-up"></i>
					</a>
				</th>

				<th>files<br/>
					<a title="Sort Descending" href="{$orderbyfiles_desc}">
						<i class="fa-icon-caret-down"></i>
					</a>
					<a title="Sort Ascending" href="{$orderbyfiles_asc}">
						<i class="fa-icon-caret-up"></i>
					</a>
				</th>

				<th>stats<br/>
					<a title="Sort Descending" href="{$orderbystats_desc}">
						<i class="fa-icon-caret-down"></i>
					</a>
					<a title="Sort Ascending" href="{$orderbystats_asc}">
						<i class="fa-icon-caret-up"></i>
					</a>
				</th>
				<th>action</th>
			</tr>

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
		{assign var="mcat" value=","|explode:$result.grp_release_categoryID}
		{assign var="mcatname" value=","|explode:$result.grp_release_categoryName}
		{foreach from=$msplits item=m}

			<tr class="{cycle values=",alt"}" id="guid{$mguid[$m@index]}">
				<td class="check"><input id="chk{$mguid[$m@index]|substr:0:7}" type="checkbox" class="nzb_check" value="{$mguid[$m@index]}" /></td>
				<td class="item">
					<label for="chk{$mguid[$m@index]|substr:0:7}">
						<a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$mguid[$m@index]}/{$mname[$m@index]|escape:"seourl"}">{$mname[$m@index]|escape:"htmlall"|replace:".":" "}</a>
					</label>
					
					{if $mpass[$m@index] == 2}
						<i class="fa-icon-lock"></i>
					{elseif $mpass[$m@index] == 1}
						<i class="fa-icon-lock"></i>
					{/if}
					
					<div class="resextra">
						<div class="btns">{strip}
							{if $mnfo[$m@index] > 0}<a href="{$smarty.const.WWW_TOP}/nfo/{$mguid[$m@index]}" title="View Nfo" class="modal_nfo rndbtn badge" rel="nfo">Nfo</a>{/if}
							{if $mhaspreview[$m@index] == 1 && $userdata.canpreview == 1}<a href="{$smarty.const.WWW_TOP}/covers/preview/{$mguid[$m@index]}_thumb.jpg" name="name{$mguid[$m@index]}" title="View Screenshot" class="modal_prev rndbtn badge" rel="preview">Preview</a>{/if}
							{if $mre[$m@index] > 0}<span class="mediainfo rndbtn badge" title="{$mguid[$m@index]}">Media</span>{/if}
						{/strip}</div>
					</div>
				</td>
				<td class="less"><a title="Browse {$mcatname[$m@index]}" href="{$smarty.const.WWW_TOP}/browse?t={$mcat[$m@index]}">{$mcatname[$m@index]}</a></td>
				<td class="less mid" title="{$mpostdate[$m@index]}">{$mpostdate[$m@index]|timeago}</td>
				<td class="less right">{$msize[$m@index]|fsize_format:"MB"}</td>
				<td class="less mid">
					<a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$mguid[$m@index]}">{$mtotalparts[$m@index]}</a>
					{if $minnerfiles[$m@index] > 0}
						<div class="rarfilelist">
							<i class="fa-icon-search"></i>				
						</div>
					{/if}
				</td>
				
				<td class="less nowrap">
					<a title="View comments" href="{$smarty.const.WWW_TOP}/details/{$mguid[$m@index]}/#comments">{$mcomments[$m@index]}</a> <i class="fa-icon-comments-alt"></i>
					<br/>{$mgrabs[$m@index]} <i class="icon-download-alt"></i>
				</td>
				
				<td class="icons">
					<div class="icon icon_nzb">
						<a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$mguid[$m@index]}/{$mname[$m@index]|escape:"url"}">
							<img src="{$smarty.const.WWW_TOP}/templates/writhem/images/icons/nzbup.png"/>
						</a>
					</div>
					<div class="icon icon_cart" title="{$themevars.cart_name_add}">
						<img src="{$smarty.const.WWW_TOP}/templates/writhem/images/icons/cartup.png"/>
					</div>
					{if $sabintegrated}
						<div class="icon">
							<div id="sab">
								<div class="icon_sab" title="Send to my Sabnzbd">	
									<img src="{$smarty.const.WWW_TOP}/templates/writhem/images/icons/sabup.png"/>
								</div>
							</div>
						</div>
					{/if}
				</td>
			</tr>
		{/foreach}	

	</table>
	
	<br/>
	
	{$pager}
	{if $results|@count > 10}
		<div class="well well-small">
			<div class="nzb_multi_operations">
				{if $section != ''}View: <a href="{$smarty.const.WWW_TOP}/{$section}?t={$category}">Covers</a> | <b>List</b><br />{/if}
				With Selected:
				<div class="btn-group">
					<input type="button" class="nzb_multi_operations_download btn btn-small btn-success" value="Download NZBs" />
					<input type="button" class="nzb_multi_operations_cart btn btn-small btn-info" value="{$themevars.cart_name_add}" />
					{if $sabintegrated}<input type="button" class="nzb_multi_operations_sab btn btn-small btn-primary" value="Send to SAB" />{/if}
				</div>

				{if $isadmin}
				<div class="pull-right">
					Admin: 	
					<div class="btn-group">	
						<input type="button" class="nzb_multi_operations_edit btn btn-small btn-warning" value="Edit" />
						<input type="button" class="nzb_multi_operations_delete btn btn-small btn-inverse" value="Delete" />
					</div>
				</div>
				{/if}	
			</div>
		</div>
	
		</form>
	{/if}
	{/foreach}

{/if}


