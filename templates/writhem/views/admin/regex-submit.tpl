<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<p>Use this feature to submit any regex you have added locally to newznab. We'll have a look at integrating them into the master list. No data other than regex's with an ID greater than 10000 will be sent.</p>

{if $upload_status eq 'OK'}
<div class="alert alert-success">
	<strong>Thanks!</strong> Your regexes were uploaded. Thank you for contributing.
</div>
<br />
{/if}

{if $upload_status eq 'BAD'}
<div class="alert alert-error">
	<strong>Failes!</strong> Failed to upload your regexes :-( - please try again..
</div>
<br />
{/if}

{if $regex_error}
<div class="alert alert-info">
	<strong>Hm!</strong> No avalible user regex's. Please add some and visit this page again.
</div>
<br />
{else}
<form action="{$SCRIPT_NAME}" method="post" name="submit_regex">
  <input type="hidden" name="regex_submit_please" value="1" />
  <input class="btn btn-success" type="submit" name="submit" value="Submit regular expressions" />
</form>

<br />

<p>
  <strong>Regexes to be submitted:</strong>
  <br />
  <pre>
  {$regex_contents|print_r}
  </pre>
</p>
{/if}

