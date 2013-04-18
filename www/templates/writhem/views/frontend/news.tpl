
<h1>News</h1>
	
{if !$userdata.hideads}
<table class="adblock" cellspacing="0" cellpadding="0"><tr><td>{$site->adbrowse}</td></tr></table><br />
{/if}
    
{if $results|@count > 0}

  {$pager}

  <a id="top"></a>

  <table style="width:100%;" class="table table-striped table-bordered" id="forumtable">
    <tr>
      <th width="60%">Topic</th>
      <th>Posted By</th>
      <th>Last Update</th>
      <th width="5%" class="mid">Replies</th>
    </tr>

    {foreach from=$results item=result}
      <tr class="{cycle values=",alt"}" id="guid{$result.ID}">
        <td style="cursor:pointer;" class="item" onclick="document.location='{$smarty.const.WWW_TOP}/newspost/{$result.ID}';">
          <a title="View post" class="title" href="{$smarty.const.WWW_TOP}/newspost/{$result.ID}">{$result.subject|escape:"htmlall"|truncate:100:'...':true:true}</a>
          <div class="hint">
            {$result.message|escape:"htmlall"|truncate:200:'...':false:false}
          </div>
        </td>
        <td>
          <a title="View profile" href="{$smarty.const.WWW_TOP}/profile/?name={$result.username}">{$result.username}</a>
          <br/>
          on <span title="{$result.createddate}">{$result.createddate|date_format}</span> <div class="hint">({$result.createddate|timeago})</div>
        </td>
        <td>
          <a href="{$smarty.const.WWW_TOP}/newspost/{$result.ID}#last" title="{$result.updateddate}">{$result.updateddate|date_format}</a> <div class="hint">({$result.updateddate|timeago})</div>
        </td>
        <td class="mid">{$result.replies}</td>
      </tr>
    {/foreach}
    
  </table>
  <table width="100%">
    <tr>
      <td>{$pager}</td>
      <td style="text-align:right">
        <div class="btn-group"style="float:right;margin-top:5px;">
          {if $userdata.rolename == "Admin"}
          <a id="newpost_btn" class="btn btn-mini btn-inverse"  data-toggle="buttons-checkbox" onclick="jQuery('#newpost').toggle();">Add New</a>
          {/if}				
          <a class="btn btn-mini" href="#top">Top</a>
        </div>
      </td>
    </tr>
  </table>

  {if $userdata.rolename == "Admin"}
  <div id="newpost" style="margin-top:10px; display:none;">
    <a id="new"></a>
    <h3>Add New Post</h3>
    <form action="" method="post">
      <div class="input-prepend">
        <span class="add-on"><label for="addSubject">Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></span>

        <input type="text" maxlength="200" id="addSubject" name="addSubject" />
      </div>
      <div class="input-prepend">

        <span class="add-on"><label for="addMessage">Message:</label></span>
        <textarea class="span7" maxlength="5000" id="addMessage" name="addMessage" rows="6" ></textarea>
      </div>

      <input class="btn btn-inverse" class="forumpostsubmit" type="submit" value="Add New Post"/>
    </form>
  </div>
  {/if}

{/if}

<br/><br/><br/>