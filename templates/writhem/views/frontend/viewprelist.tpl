<h1>{$page->title}</h1>

<div style="float:right;margin-bottom:5px;">
</div>

{if !$userdata.premium}
<table class="adblock" cellspacing="0" cellpadding="0"><tr><td>{$site->adbrowse}</td></tr></table><br />
{/if}

{if $results|@count > 0}

<table width="100%">
  <tr>
    <td>{$pager}</td>
    <td style="float:right;">  
      <form class="form-inline" name="predbsearch" action="" method="get" style="margin:0;">
        <div class="input-append">
          <input class="input input-large" id="q" type="text" name="q" value="{$query}" placeholder="Search" />
          <input class="btn" type="submit" value="Search" />
        </div>
      </form>
    </td>
  </tr>
</table>
<table style="width:100%;" class="table table-bordered table-striped table-hover data highlight icons" id="browsetable">
	<tr>
		<th width="75" class="mid">Date</th>
		<th class="left">Directory</th>
		<th class="mid">Category</th>
		<th class="mid">FS/FC</th>
	</tr>

	{foreach $results as $pre}
		<tr class="{cycle values=",alt"}">

			<td class="left">
                <span title="{$pre.ctime|date_format}">{$pre.ctime|timeago} ago</span>
            </td>
			<td class="left">
				{if $pre.guid != ''}

                    <a title="View details" href="{$smarty.const.WWW_TOP}/details/{$pre.guid}/{$pre.dirname}">{$pre.dirname|wordwrap:80:"\n":true}</a>
				{else}

                    {$pre.dirname|wordwrap:80:"\n":true}


                {/if}
				{if $pre.nuketype != '' && $pre.nukereason != ''}
          <span class="badge label-warning">
              <i class="icon-warning-sign icon-white" title="{$pre.nukereason}"></i>
              {if preg_match('/^(UN)?((MOD)?NUKE?|DELPRE|MOD|LOCAL)$/', $pre.nuketype)}
                  {$pre.nuketype}NUKE<!--:{$pre.nukereason}-->
              {else}
                  NUKED<!--:{$pre.nukereason} [{$pre.nuketype}]-->
              {/if}
          </span>
				{/if}
			</td>
			<td class="mid"><a href="{$smarty.const.WWW_TOP}/predb?c={$pre.category}">{$pre.category}</a></td>
			<td class="mid">{if $pre.filesize > 0}{$pre.filesize}MB{if $pre.filecount > 0}/{$pre.filecount}F{/if}{else}--{/if}</td>
		</tr>
	{/foreach}
</table>


{$pager}

{else}




<h2>No results.</h2>
{/if}
