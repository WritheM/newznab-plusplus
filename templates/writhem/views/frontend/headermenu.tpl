<div class="navbar"> 
	<div class="navbar-inner" data-spy="affix" data-offset-top="105"> 
		<ul class="nav">
      <li class="dropdown">
				&nbsp;<div class="btn-group">
					<a class="btn" title="Browse All" href="{$smarty.const.WWW_TOP}/browse">
						<i class="icon-th-list"></i> Browse
					</a>
					<button class="btn dropdown-toggle" data-toggle="dropdown">
						<span class="caret"></span>
					</button>

					<ul class="dropdown-menu">
						<li><a title="Browse Groups" href="{$smarty.const.WWW_TOP}/browsegroup">Groups</a></li>
					</ul>
				</div>
			</li>
		{foreach from=$parentcatlist item=parentcat}
			{if $parentcat.ID == 1000 && $userdata.consoleview=="1"}
			<li class="dropdown">
				&nbsp;<div class="btn-group">
					<a class="btn" title="Browse {$parentcat.title}" href="{$smarty.const.WWW_TOP}/console">
						<i class="icon-road"></i> {$parentcat.title} 
					</a>
					<button class="btn dropdown-toggle" data-toggle="dropdown">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
					{foreach from=$parentcat.subcatlist item=subcat}
						<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/console?t={$subcat.ID}">{$subcat.title}</a></li>
					{/foreach}
					</ul>
				</div>
			</li>
			{elseif $parentcat.ID == 2000 && $userdata.movieview=="1"}
			<li class="dropdown">
				&nbsp;<div class="btn-group">
					<a class="btn" title="Browse {$parentcat.title}" href="{$smarty.const.WWW_TOP}/movies">
						<i class="icon-film"></i> {$parentcat.title}
					</a>
					<button class="btn dropdown-toggle" data-toggle="dropdown">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
					{foreach from=$parentcat.subcatlist item=subcat}
						<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/movies?t={$subcat.ID}">{$subcat.title}</a></li>
					{/foreach}
					</ul>
				</div>
			</li>
			{elseif ($parentcat.ID == 3000 && $userdata.musicview=="1")}
			<li class="dropdown">
				&nbsp;<div class="btn-group">
					<a class="btn" title="Browse {$parentcat.title}" href="{$smarty.const.WWW_TOP}/music">
						<i class="icon-music"></i> {$parentcat.title}
					</a>
					<button class="btn dropdown-toggle" data-toggle="dropdown">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
					{foreach from=$parentcat.subcatlist item=subcat}
						{if $subcat.ID == 3030}
							<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/browse?t={$subcat.ID}">{$subcat.title}</a></li>
						{else}
							<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/music?t={$subcat.ID}">{$subcat.title}</a></li>
						{/if}
					{/foreach}
					</ul>
				</div>
			</li>
			{else}
			<li class="dropdown">
				&nbsp;<div class="btn-group">
					<a class="btn" title="Browse {$parentcat.title}" href="{$smarty.const.WWW_TOP}/browse?t={$parentcat.ID}">
						{if ($parentcat.ID == 4000)}
						<i class="icon-hdd"></i> {$parentcat.title}
						{elseif ($parentcat.ID == 5000)}
						<i class="icon-calendar"></i> {$parentcat.title}
						{else}
						<i class="icon-book id-{$parentcat.ID}"></i> {$parentcat.title}
						{/if}
					</a>
					<button class="btn dropdown-toggle" data-toggle="dropdown">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
					{foreach from=$parentcat.subcatlist item=subcat}
						{if ($subcat.ID == 7020 && $userdata.bookview=="1")}
							<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/books">{$subcat.title}</a></li>
						{else}
							<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/browse?t={$subcat.ID}">{$subcat.title}</a></li>
						{/if}
					{/foreach}
					</ul>
				</div>
			</li>
			{/if}
		{/foreach}
		</ul>
	</div>		
	<!-- search bar -->
	<form id="headsearch_form" action="{$smarty.const.WWW_TOP}/search/" method="get" class="navbar-search pull-right">
		<div class="input-prepend input-append">
			<select id="headcat" name="t" tabindex="2" style="width:125px;">
				<option class="grouping" value="-1">All</option>
				{foreach from=$parentcatlist item=parentcat}
					<option {if $header_menu_cat==$parentcat.ID}selected="selected"{/if} class="grouping" value="{$parentcat.ID}">{$parentcat.title}</option>
					{foreach from=$parentcat.subcatlist item=subcat}
						<option {if $header_menu_cat==$subcat.ID}selected="selected"{/if} value="{$subcat.ID}">&nbsp;&nbsp;{$subcat.title}</option>
					{/foreach}
				{/foreach}
			</select>
			<input id="headsearch" name="search" type="text" class="search-query" placeholder="{if $header_menu_search == ""}Enter keywords{else}{$header_menu_search|escape:"htmlall"}{/if}" style="width:85px;" type="text" tabindex="1" />
			<button type="button" id="headsearch_go" class="btn"><i class="icon-search"></i></button>
		</div>
			
			
	</form>
</div>