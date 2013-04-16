<div class="page-header">
	<h1>Add to category</h1>
When you add a show to your list of followed shows, you can filter the results in 
your collection to a certain category. Select them now:
</div>
<h3>{$type|ucwords} {$show.releasetitle|escape:"htmlall"} in</h3>


<form class="form-horizontal" id="myshows" action="{$smarty.const.WWW_TOP}/myshows/do{$type}" method="post">
	<input type="hidden" name="subpage" value="{$rid}" />
	
	<div class="control-group">
		<label class="control-label" for="category">Choose</label>
		<div class="controls">
			{if $from}<input type="hidden" name="from" value="{$from}" />{/if}
			{html_checkboxes id="category" name='category' values=$cat_ids output=$cat_names selected=$cat_selected separator=''}
		</div>
	</div>
	<div class="control-group">
		<label class="control-label"></label>
		<div class="controls">
			<input class="btn" type="submit" name="{$type}" value="{$type|ucwords}" />
		</div>
	</div>
</form>