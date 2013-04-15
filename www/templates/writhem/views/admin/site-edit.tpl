<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<form class="form-horizontal" action="{$SCRIPT_NAME}?action=submit" method="post">
	{if $error != ''}
	<div class="alert alert-error"><strong>Error!</strong>{$error}</div>
	{/if}
	<fieldset>
		<legend>Main Site Settings, HTML Layout, Tags</legend>

		<div class="control-group">
			<label class="control-label" for="title">Title</label>
			<div class="controls">
				<input class="input input-xxlarge" id="title" class="long" name="title" type="text" value="{$fsite->title}" />
				<span class="help-block">Displayed around the site and contact form as the name for the site.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="strapline">Strapline</label>
			<div class="controls">
				<input class="input input-xxlarge" id="strapline" class="long" name="strapline" type="text" value="{$fsite->strapline}" />
				<span class="help-block">Displayed in the header on every public page.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="metatitle">Meta Title</label>
			<div class="controls">
				<input class="input input-xxlarge" id="metatitle" class="long" name="metatitle" type="text" value="{$fsite->metatitle}" />
				<span class="help-block">Stem meta-tag appended to all page title tags.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="metadescription">Meta Description</label>
			<div class="controls">
				<textarea cols="100" rows="5" class="input input-xxlarge" id="metadescription" name="metadescription">{$fsite->metadescription}</textarea>
				<span class="help-block">Stem meta-description appended to all page meta description tags.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="metakeywords">Meta Keywords</label>
			<div class="controls">
				<textarea cols="100" rows="5" class="input input-xxlarge" id="metakeywords" name="metakeywords">{$fsite->metakeywords}</textarea>
				<span class="help-block">Stem meta-keywords appended to all page meta keyword tags.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="footer">Footer</label>
			<div class="controls">
				<textarea cols="100" rows="5" class="input input-xxlarge" id="footer" name="footer">{$fsite->footer}</textarea>
				<span class="help-block">Displayed in the footer section of every public page.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="style">Default Home Page</label> 
			<div class="controls">
				<input class="input input-xxlarge" id="home_link" class="long" name="home_link" type="text" value="{$fsite->home_link}" />
				<span class="help-block">The relative path to a the landing page shown when a user logs in, or clicks the home link.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="codename">Code Name</label>
			<div class="controls">
				<input class="input input-xxlarge" id="codename" name="code" type="text" value="{$fsite->code}" />
				<input type="hidden" name="id" value="{$fsite->id}" />
				<span class="help-block">A just for fun value shown in debug and not on public pages.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="style">Theme</label>
			<div class="controls">
				{html_options class="siteeditstyle" id="style" name='style' values=$themelist output=$themelist selected=$fsite->style}
				<span class="help-block">The theme folder which will be loaded for css and images. (Use / for default)</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="style">Dereferrer Link</label>
			<div class="controls">
				<input class="input input-xxlarge" id="dereferrer_link" class="long" name="dereferrer_link" type="text" value="{$fsite->dereferrer_link}" />
				<span class="help-block">Optional URL to prepend to external links.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="apienabled">Api Enabled</label>
			<div class="controls">
				{html_radios id="apienabled" name='apienabled' values=$yesno_ids output=$yesno_names selected=$fsite->apienabled separator=''}
				<span class="help-block">Whether access to the site via the API is enabled.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="showrecentforumposts">Recent Forum Posts</label>
			<div class="controls">
				<input class="input input-xxlarge" id="showrecentforumposts" name="showrecentforumposts" type="text" value="{$fsite->showrecentforumposts}" />
				<span class="help-block">The number of recent forum posts to show in the 'recent forum posts' widget. Set to 0 to disable.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="email">Email</label> 
			<div class="controls">
				<input class="input input-xxlarge" id="email" class="long" name="email" type="text" value="{$fsite->email}" />
				<span class="help-block">Shown in the contact us page, and where the contact html form is sent to..</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="tandc">Terms and Conditions</label>
			<div class="controls">
				<textarea cols="100" rows="5"  class="input input-xxlarge" id="tandc" name="tandc">{$fsite->tandc}</textarea>
				<span class="help-block">Text displayed in the terms and conditions page.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="newznabID">newznab ID</label>
			<div class="controls">
				<input class="input input-xxlarge" id="newznabID" class="long" name="newznabID" type="text" value="{$fsite->newznabID}" />
				<span class="help-block">Your registered newznab ID.</span>
			</div>
		</div>

	</fieldset>

	<fieldset>
		<legend>Google Adsense, Analytics and 3rd Party Banners</legend>

		<div class="control-group">
			<label class="control-label" for="google_analytics_acc">Google Analytics</label>
			<div class="controls">
				<input class="input input-xxlarge" id="google_analytics_acc" name="google_analytics_acc" type="text" value="{$fsite->google_analytics_acc}" />
				<span class="help-block">e.g. UA-xxxxxx-x</span>
			</div>
		</div>		

		<div class="control-group">
			<label class="control-label" for="google_adsense_acc">Google Adsense</label>
			<div class="controls">
				<input class="input input-xxlarge" id="google_adsense_acc" name="google_adsense_acc" type="text" value="{$fsite->google_adsense_acc}" />
				<span class="help-block">e.g. pub-123123123123123</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="google_adsense_search">Google Adsense Search</label>
			<div class="controls">
				<input class="input input-xxlarge" class="input input-xxlarge" id="google_adsense_search" name="google_adsense_search" type="text" value="{$fsite->google_adsense_search}" />
				<span class="help-block">The ID of the google search ad panel displayed at the bottom of the left menu.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="adheader">Advert Space in Banner</label>
			<div class="controls">
				<textarea cols="100" rows="5" class="input input-xxlarge" id="adheader" name="adheader">{$fsite->adheader}</textarea>
				<span class="help-block">The banner slot in the header.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="adbrowse">Advert Space in Browse List</label>
			<div class="controls">
				<textarea cols="100" rows="5" class="input input-xxlarge" id="adbrowse" name="adbrowse">{$fsite->adbrowse}</textarea>
				<span class="help-block">The banner slot in the header.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="addetail">Advert Space in Detail View</label>
			<div class="controls">
				<textarea cols="100" rows="5"  class="input input-xxlarge" id="addetail" name="addetail">{$fsite->addetail}</textarea>
				<span class="help-block">The banner slot in the release details view.</span>
			</div>
		</div>
	</fieldset>

	<fieldset>
		<legend>3<sup>rd</sup> Party API Keys</legend>

		<div class="control-group">
			<label class="control-label" for="tmdbkey">TMDB Key</label>
			<div class="controls">
				<input class="input input-xxlarge" id="tmdbkey" class="long" name="tmdbkey" type="text" value="{$fsite->tmdbkey}" />
				<span class="help-block">The api key used for access to tmdb</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="rottentomatokey">Rotten Tomatoes Key</label>
			<div class="controls">
				<input class="input input-xxlarge" id="rottentomatokey" class="long" name="rottentomatokey" type="text" value="{$fsite->rottentomatokey}" />
				<span class="help-block">The api key used for access to rotten tomatoes</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="amazonpubkey">Amazon Public Key</label>
			<div class="controls">
				<input class="input input-xxlarge" id="amazonpubkey" class="long" name="amazonpubkey" type="text" value="{$fsite->amazonpubkey}" />
				<span class="help-block">The amazon public api key. Used for cover lookups.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="amazonprivkey">Amazon Private Key</label> 
			<div class="controls">
				<input class="input input-xxlarge" id="amazonprivkey" class="long" name="amazonprivkey" type="text" value="{$fsite->amazonprivkey}" />
				<span class="help-block">The amazon private api key. Used for cover lookups.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="amazonassociatetag">Amazon Associate Tag</label>
			<div class="controls">
				<input class="input input-xxlarge" id="amazonassociatetag" class="long" name="amazonassociatetag" type="text" value="{$fsite->amazonassociatetag}" />
				<span class="help-block">The amazon associate tag. Used for cover lookups.</span>
			</div>
		</div>
	</fieldset>

	<fieldset>
		<legend>3<sup>rd</sup> Party Application Paths</legend>
		<div class="control-group">
			<label class="control-label" for="unrarpath">Unrar Path</label>
			<div class="controls">
				<input class="input input-xxlarge" id="unrarpath" class="long" name="unrarpath" type="text" value="{$fsite->unrarpath}" />
				<span class="help-block">The path to an unrar binary, used in deep password detection and media info grabbing. 
					<br/>Use forward slashes in windows <code>c:/path/to/unrar.exe</code>
				</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="tmpunrarpath">Temp Unrar File Path</label>
			<div class="controls">
				<input class="input input-xxlarge" id="tmpunrarpath" class="long" name="tmpunrarpath" type="text" value="{$fsite->tmpunrarpath}" />
				<span class="help-block">The path to where unrar puts files. WARNING: This directory will have its contents deleted. 
					<br/>Use forward slashes in windows <code>c:/temp/path/stuff/will/be/unpacked/to</code>
				</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="mediainfopath">Mediainfo Path</label>
			<div class="controls">
				<input class="input input-xxlarge" id="mediainfopath" class="long" name="mediainfopath" type="text" value="{$fsite->mediainfopath}" />
				<span class="help-block">The path to the <a href="http://mediainfo.sourceforge.net">mediainfo</a> binary. Used for deep file media analysis. Use empty path to disable mediainfo checks. 
					<br/>Use forward slashes in windows <code>c:/path/to/mediainfo.exe</code>
				</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="ffmpegpath">Ffmpeg Path</label>
			<div class="controls">
				<input class="input input-xxlarge" id="ffmpegpath" class="long" name="ffmpegpath" type="text" value="{$fsite->ffmpegpath}" />
				<span class="help-block">The path to the <a href="http://www.ffmpeg.org/">ffmpeg</a> binary. Used for thumbnailing. Use empty path to disable thumbnailing. 
					<br/>Use forward slashes in windows <code>c:/path/to/ffmpeg.exe</code>
				</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="lamepath">Lame Path</label>
			<div class="controls">
				<input class="input input-xxlarge" id="lamepath" class="long" name="lamepath" type="text" value="{$fsite->lamepath}" />
				<span class="help-block">The path to the <a href="http://lame.sourceforge.net/download.php">lame</a> binary. Used for audio manipulation.
					<br/>Use forward slashes in windows <code>c:/path/to/lame.exe</code>
				</span>
			</div>
		</div>
	</fieldset>


	<fieldset>
		<legend>SABnzbd Integration Settings</legend>

		<div class="control-group">
			<label class="control-label" for="sabintegrationtype">Integration Type</label>
			<div class="controls">
				{html_radios id="sabintegrationtype" name='sabintegrationtype' values=$sabintegrationtype_ids output=$sabintegrationtype_names selected=$fsite->sabintegrationtype separator=''}
				<span class="help-block">Whether to allow integration with a SAB install and if so what type of integration</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="saburl">SABnzbd Url</label>
			<div class="controls">
				<input class="input input-xxlarge" id="saburl" class="long" name="saburl" type="text" value="{$fsite->saburl}" />
				<span class="help-block">The url of the SAB installation, for example: <code>http://localhost:8080/sabnzbd/</code></span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sabapikey">SABnzbd Api Key</label>
			<div class="controls">
				<input class="input input-xxlarge" id="sabapikey" class="long" name="sabapikey" type="text" value="{$fsite->sabapikey}" />
				<span class="help-block">The Api key of the SAB installation. Can be the full api key or the nzb api key (as of SAB 0.6)</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sabapikeytype">Api Key Type</label>
			<div class="controls">
				{html_radios id="sabapikeytype" name='sabapikeytype' values=$sabapikeytype_ids output=$sabapikeytype_names selected=$fsite->sabapikeytype separator=''}
				<span class="help-block">Select the type of api key you entered in the above setting</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sabpriority">Priority Level</label>
			<div class="controls">
				{html_options id="sabpriority" name='sabpriority' values=$sabpriority_ids output=$sabpriority_names selected=$fsite->sabpriority}
				<span class="help-block">Set the priority level for NZBs that are added to your queue</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sabcompletedir">SABnzbd Complete Path</label>
			<div class="controls">
				<input class="input input-xxlarge" id="sabcompletedir" class="long" name="sabcompletedir" type="text" value="{$fsite->sabcompletedir}" />
				<span class="help-block">The downloads/complete folder for a local sab install, for example: <code>/var/www/sab/downloads/complete</code></span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sabvdir">SABnzbd Complete Vdir URL</label>
			<div class="controls">
				<input class="input input-xxlarge" id="sabvdir" class="long" name="sabvdir" type="text" value="{$fsite->sabvdir}" />
				<span class="help-block">A url to a hosted virtual directory pointing to the sab downloads/complete folder, e.g. <code>http://server/complete</code></span>
			</div>
		</div>
	</fieldset>


	<fieldset>
		<legend>Usenet Settings</legend>

		<div class="control-group">
			<label class="control-label" for="nzbpath">Nzb File Path</label>
			<div class="controls">
				<input class="input input-xxlarge" id="nzbpath" class="long" name="nzbpath" type="text" value="{$fsite->nzbpath}" />
				<span class="help-block">The directory where nzb files will be stored.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="rawretentiondays">Header Retention</label>
			<div class="controls">
				<input class="input input-xxlarge" class="tiny" id="rawretentiondays" name="rawretentiondays" type="text" value="{$fsite->rawretentiondays}" />
				<span class="help-block">The number of days binary and part data will be retained for use in raw search and release formation. <strong>Set to 0 during import to remove headers immediately.</strong></span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="releaseretentiondays">Release Retention</label>
			<div class="controls">
				<input class="input input-xxlarge" class="tiny" id="releasedays" name="releaseretentiondays" type="text" value="{$fsite->releaseretentiondays}" />
				<span class="help-block">The number of days releases will be retained for use throughout site. Set to 0 to disable.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="minfilestoformrelease">Minimum Files to Make a Release</label>
			<div class="controls">
				<input class="input input-xxlarge" class="tiny" id="minfilestoformrelease" name="minfilestoformrelease" type="text" value="{$fsite->minfilestoformrelease}" />
				<span class="help-block">The minimum number of files to make a release. i.e. if set to two, then releases which only contain one file will not be created.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="minsizetoformrelease">Minimum File Size to Make a Release</label>
			<div class="controls">
				<input class="input input-xxlarge" class="small" id="minsizetoformrelease" name="minsizetoformrelease" type="text" value="{$fsite->minsizetoformrelease}" />
				<span class="help-block">The minimum total size in bytes to make a release. If set to 0, then ignored.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="completionpercent">Minimum Completion Percent to Make a Release</label>
			<div class="controls">
				<input class="input input-xxlarge" class="tiny" id="completionpercent" name="completionpercent" type="text" value="{$fsite->completionpercent}" />
				<span class="help-block">The minimum completion percent to make a release. i.e. if set to 97, then releases under 97% completion will not be created. If set to 0, then ignored.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="removespam">Remove Spam</label>
			<div class="controls">
				{html_radios id="removespam" name='removespam' values=$yesno_ids output=$yesno_names selected=$fsite->removespam separator=''}
				<span class="help-block">Find and remove spam after each update. An inexact science which uses a few methods to identify virus/spam posts.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="exepermittedcategories">Spam - Accepted Exe Categories</label>
			<div class="controls">
				<input class="input input-xxlarge" id="exepermittedcategories" class="long" name="exepermittedcategories" type="text" value="{$fsite->exepermittedcategories}" />
				<span class="help-block">Which categories to permit .exe files. Requires unrar inner file checking to be enabled.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="compressedheaders">Use Compressed Headers</label>
			<div class="controls">
				{html_radios class="$compress_headers_warning" id="compressedheaders" name='compressedheaders' values=$yesno_ids output=$yesno_names selected=$fsite->compressedheaders separator=''}
				<span class="help-block">Some servers allow headers to be sent over in a compressed format.  If enabled this will use much less bandwidth, but processing times may increase.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="maxmssgs">Max Messages</label>
			<div class="controls">
				<input class="input input-xxlarge" class="small" id="maxmssgs" name="maxmssgs" type="text" value="{$fsite->maxmssgs}" />
				<span class="help-block">The maximum number of messages to fetch at a time from the server.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="newgroupscanmethod">Where to start new groups</label>
			<div class="controls">
				{html_radios id="newgroupscanmethod" name='newgroupscanmethod' values=$yesno_ids output=$newgroupscan_names selected=$fsite->newgroupscanmethod separator=''}
				<input class="input input-medium" class="tiny" id="newgroupdaystoscan" name="newgroupdaystoscan" type="text" value="{$fsite->newgroupdaystoscan}" /> Days  or
				<input class="input input-medium" class="small" id="newgroupmsgstoscan" name="newgroupmsgstoscan" type="text" value="{$fsite->newgroupmsgstoscan}" /> Posts
				<span class="help-block">Scan back X (posts/days) for each new group?  Can backfill to scan further.</span>
			</div>
		</div>
	</fieldset>

	<fieldset>
		<legend>Lookup Settings</legend>

		<div class="control-group">
			<label class="control-label" for="reqidurl">Allfilled Lookup URL</label>
			<div class="controls">
				<input class="input input-xxlarge" class="long" id="reqidurl" name="reqidurl" type="text" value="{$fsite->reqidurl}" />
				<span class="help-block">The url for allfilled posts. Leave blank to not perform lookup.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="reqidurl">Latest Regex Lookup URL</label>
			<div class="controls">
				<input class="input input-xxlarge" class="long" id="latestregexurl" name="latestregexurl" type="text" value="{$fsite->latestregexurl}" />
				<span class="help-block">The url to use to retrieve all community contributed regexes. Leave blank to not perform lookup.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="lookupnfo">Lookup Nfo</label>
			<div class="controls">
				{html_radios id="lookupnfo" name='lookupnfo' values=$yesno_ids output=$yesno_names selected=$fsite->lookupnfo separator=''}
				<span class="help-block">Whether to attempt to retrieve the an nfo file from usenet when processing binaries.<br/><strong>NOTE: disabling nfo lookups will disable movie lookups.</strong></span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="lookuptvrage">Lookup TV Rage</label>
			<div class="controls">
				{html_radios id="lookuptvrage" name='lookuptvrage' values=$yesno_ids output=$yesno_names selected=$fsite->lookuptvrage separator=''}
				<span class="help-block">Whether to attempt to lookup tv rage ids on the web when processing.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="lookupthetvdb">Lookup TheTVDB</label>
			<div class="controls">
				{html_radios id="lookupthetvdb" name='lookupthetvdb' values=$yesno_ids output=$yesno_names selected=$fsite->lookupthetvdb separator=''}
				<span class="help-block">Whether to attempt to lookup additional series information from TheTVDB when processing.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="lookupimdb">Lookup Movies</label>
			<div class="controls">
				{html_radios id="lookupimdb" name='lookupimdb' values=$yesno_ids output=$yesno_names selected=$fsite->lookupimdb separator=''}
				<span class="help-block">Whether to attempt to lookup film information from IMDB or TheMovieDB when processing.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="lookupanidb">Lookup AniDB</label>
			<div class="controls">
				{html_radios id="lookupanidb" name='lookupanidb' values=$yesno_ids output=$yesno_names selected=$fsite->lookupanidb separator=''}
				<span class="help-block">Whether to attempt to lookup anime information from AniDB when processing.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="lookupmusic">Lookup Music</label>
			<div class="controls">
				{html_radios id="lookupmusic" name='lookupmusic' values=$yesno_ids output=$yesno_names selected=$fsite->lookupmusic separator=''}
				<span class="help-block">Whether to attempt to lookup music information from Amazon when processing.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="lookupgames">Lookup Games</label>
			<div class="controls">
				{html_radios id="lookupgames" name='lookupgames' values=$yesno_ids output=$yesno_names selected=$fsite->lookupgames separator=''}
				<span class="help-block">Whether to attempt to lookup game information from Amazon when processing.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="lookupbooks">Lookup Books</label>
			<div class="controls">
				{html_radios id="lookupbooks" name='lookupbooks' values=$yesno_ids output=$yesno_names selected=$fsite->lookupbooks separator=''}
				<span class="help-block">Whether to attempt to lookup book information from Amazon when processing.</span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="lookuplanguage">Movie Lookup Language</label>
			<div class="controls">
				{html_options id="lookuplanguage" name='lookuplanguage' values=$lookuplanguage_iso output=$lookuplanguage_names selected=$fsite->lookuplanguage}
				<span class="help-block">Preferred language for scraping external sources.</span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="saveaudiopreview">Save Audio Preview</label>
			<div class="controls">
				{html_radios id="saveaudiopreview" name='saveaudiopreview' values=$yesno_ids output=$yesno_names selected=$fsite->saveaudiopreview separator=''}
				<span class="help-block">Whether to save a preview of an audio release (requires deep rar inspection enabled).
					<br/>It is advisable to specify a path to the lame binary to reduce the size of audio previews.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="audiopreviewprune">Prune Audio Preview</label>
			<div class="controls">
				<input class="input input-xxlarge" id="audiopreviewprune" class="short" name="audiopreviewprune" type="text" value="{$fsite->audiopreviewprune}" />
				<span class="help-block">Delete any audio previews older than this number of days.</span>
			</div>
		</div>
	</fieldset>

	<fieldset>
		<legend>Password Settings</legend>

		<div class="control-group">
			<label class="control-label" for="checkpasswordedrar">Check For Passworded Releases</label>
			<div class="controls">
				{html_radios id="checkpasswordedrar" name='checkpasswordedrar' values=$passwd_ids output=$passwd_names selected=$fsite->checkpasswordedrar separator=''}
				<span class="help-block">Whether to attempt to peek into every release, to see if rar files are password protected.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="deletepasswordedrelease">Delete Passworded Releases</label>
			<div class="controls">
				{html_radios id="deletepasswordedrelease" name='deletepasswordedrelease' values=$yesno_ids output=$yesno_names selected=$fsite->deletepasswordedrelease separator=''}
				<span class="help-block">Whether to delete releases which are passworded or potentially passworded.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="showpasswordedrelease">Show Passworded Releases</label>
			<div class="controls">
				{html_options id="showpasswordedrelease" class='input input-xxlarge' name='showpasswordedrelease' values=$passworded_ids output=$passworded_names selected=$fsite->showpasswordedrelease}
				<span class="help-block">Whether to show passworded or potentially passworded releases in browse, search, api and rss feeds. 
					<br/>Potentially passworded means releases which contain .cab or .ace files which are typically password protected.</span>
			</div>
		</div>
	</fieldset>

		<fieldset>
		<legend>nzpre Settings</legend>

		<div class="control-group">
			<label class="control-label" for="nzpregroup">Group</label>
			<div class="controls">
				<input class="input input-xxlarge" id="nzpregroup" class="medium" name="nzpregroup" type="text" value="{$fsite->nzpregroup}" />
				<span class="help-block">Group to search when looking up nzpre posts.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="nzpresubject">Subject</label>
			<div class="controls">
				<input class="input input-xxlarge" id="nzpresubject" class="long" name="nzpresubject" type="text" value="{$fsite->nzpresubject}" />
				<span class="help-block">Subject line. eg. This is an nzpre post!</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="nzpreposter">Poster</label>
			<div class="controls">
				<input class="input input-xxlarge" id="nzpreposter" class="medium" name="nzpreposter" type="text" value="{$fsite->nzpreposter}" />
				<span class="help-block">Full poster field. eg. tester test@test.com</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="nzprefield">Field</label>
			<div class="controls">
				<input class="input input-xxlarge" id="nzprefield" class="medium" name="nzprefield" type="text" value="{$fsite->nzprefield}" />
				<span class="help-block">Which header field to parse.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="nzprearticles">Articles</label>
			<div class="controls">
				<input class="input input-xxlarge" id="nzprearticles" class="short" name="nzprearticles" type="text" value="{$fsite->nzprearticles}" />
				<span class="help-block">Number of articles to parse when updating.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="nzprekey">Key</label>
			<div class="controls">
				<input class="input input-xxlarge" id="nzprekey" class="long" name="nzprekey" type="text" value="{$fsite->nzprekey}" />
				<span class="help-block">Key to decode.</span>
			</div>
		</div>
	</fieldset>

<fieldset>
<legend>Spotnab Settings</legend>

		<div class="control-group">
			<label class="control-label" for="spotnabpost">Enable Posting</label>
			<div class="controls">
				{html_radios id="spotnabpost" name='spotnabpost' values=$yesno_ids output=$yesno_names selected=$fsite->spotnabpost separator='<br />'}
				<span class="help-block">If enabled, encrypted comments from this site will be uploaded using the spotnab protocol. These will be shared with others participating Newznab sites. Set up Spotnab sources <a href="spotnab-list.php">here</a> or use Auto Discovery.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="spotnabbroadcast">Broadcast Source</label>
			<div class="controls">
				{html_radios id="spotnabbroadcast" name='spotnabbroadcast' values=$yesno_ids output=$yesno_names selected=$fsite->spotnabbroadcast separator='<br />'}
				<span class="help-block">If enabled, a broadcast packet will be uploaded every month, so that other participating Newznab sites can automatically subscribe to your comments.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="spotnabdiscover">Auto Discover</label>
			<div class="controls">
				{html_radios id="spotnabdiscover" name='spotnabdiscover' values=$yesno_ids output=$yesno_names selected=$fsite->spotnabdiscover separator='<br />'}
				<span class="help-block">If enabled, other participating Newznab sites will be added automatically (as inactive) to your <a href="spotnab-list.php">sources list</a>.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="spotnabprivacy">Enable Privacy</label>
			<div class="controls">
				{html_radios id="spotnabprivacy" name='spotnabprivacy' values=$yesno_ids output=$yesno_names selected=$fsite->spotnabprivacy separator='<br />'}
				<span class="help-block">If enabled, uploaded comments use a unique (made up) username.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="spotnabuser">Username</label>
			<div class="controls">
				<input class="input input-xxlarge" id="spotnabuser" class="long" name="spotnabuser" type="text" value="{$fsite->spotnabuser}" />
				<span class="help-block">The username part used for posting. eg nntp</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="spotnabemail">Poster E-mail</label>
			<div class="controls">
				<input class="input input-xxlarge" id="spotnabemail" class="long" name="spotnabemail" type="text" value="{$fsite->spotnabemail}" />
				<span class="help-block">The email part used for posting. eg spot@nntp.com</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="spotnabgroup">Usenet Group</label>
			<div class="controls">
				<input class="input input-xxlarge" id="spotnabgroup" class="long" name="spotnabgroup" type="text" value="{$fsite->spotnabgroup}" />
				<span class="help-block">The group where posts are uploaded. eg alt.binaries.backup</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="spotnabsitepubkey">Public Key (MD5)</label>
			<div class="controls">
				<textarea cols="100" rows="5" class="input input-xxlarge" id="spotnabsitepubkey" name="spotnabsitepubkey">{$fsite->spotnabsitepubkey|escape:html}</textarea>
				<span class="help-block">Public key other sites will use to decrypt comments.</span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="spotnabsiteprvkey">Public Key (MD5)</label>
			<div class="controls">
				<textarea cols="100" rows="5" class="input input-xxlarge" id="spotnabsiteprvkey" name="spotnabsiteprvkey">{$fsite->spotnabsiteprvkey|escape:html}</textarea>
				<span class="help-block">Private key used to encrypt comments before uploading.</span>
			</div>
		</div>		

</table>
</fieldset>

	<fieldset>
		<legend>Sphinx Settings</legend>

		<div class="control-group">
			<label class="control-label" for="sphinxenabled">Use Sphinx</label>
			<div class="controls">
				{html_radios class="$sphinx_enabled" id="sphinxenabled" name='sphinxenabled' values=$yesno_ids output=$yesno_names selected=$fsite->sphinxenabled separator=''}
				<span class="help-block">Enable or disable Sphinx.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sphinxindexnzbs">Index NZB Contents</label>
			<div class="controls">
				{html_radios class="$sphinx_indexnzbs" id="sphinxindexnzbs" name='sphinxindexnzbs' values=$yesno_ids output=$yesno_names selected=$fsite->sphinxindexnzbs separator=''}
				<span class="help-block">Enable or disable indexing of NZB file contents.</br>
				NOTE: enabling this option will <strong>significantly</strong>increase processing time.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sphinxindexnfos">Index NFO Contents</label>
			<div class="controls">
				{html_radios class="$sphinx_indexnfos" id="sphinxindexnfos" name='sphinxindexnfos' values=$yesno_ids output=$yesno_names selected=$fsite->sphinxindexnfos separator=''})
				<span class="help-block">Enable or disable indexing of NFO contents.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sphinxindexreleasefiles">Index ReleaseFiles</label>
			<div class="controls">
				{html_radios class="$sphinx_indexreleasefiles" id="sphinxindexreleasefiles" name='sphinxindexreleasefiles' values=$yesno_ids output=$yesno_names selected=$fsite->sphinxindexreleasefiles separator=''}
				<span class="help-block">Enable or disable indexing of releasefiles table.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sphinxindexpredb">Index PreDB</label>
			<div class="controls">
				{html_radios class="$sphinx_indexpredb" id="sphinxindexpredb" name='sphinxindexpredb' values=$yesno_ids output=$yesno_names selected=$fsite->sphinxindexpredb separator=''}
				<span class="help-block">Enable or disable indexing of PreDB.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sphinxserverhost">Search Server Host</label>
			<div class="controls">
				<input class="input input-xxlarge" id="sphinxserverhost" class="long" name="sphinxserverhost" type="text" value="{$fsite->sphinxserverhost}" />
				<span class="help-block">Hostname and port of the Sphinx server (<code>searchd</code>).<br/>
					NOTE: This should be the host and port on which the
					<a target="_blank" href="http://sphinxsearch.com/docs/2.0.1/conf-listen.html">mysql41</a> protocol is being
					served.  <br />Default is <code>127.0.0.1:9306</code>.  Unless you've manually modified <code>sphinx.conf</code>, you shouldn't have to change this.</span>
				</div>
		</div>

			<div class="control-group">
			<label class="control-label" for="sphinxconfpath">Sphinx Configuration Path</label>
			<div class="controls">
				<input class="input input-xxlarge" id="sphinxconfpath" class="long" name="sphinxconfpath" type="text" value="{$fsite->sphinxconfpath}" />
				<span class="help-block">Path to <code>sphinx.conf</code>.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sphinxbinpath">Sphinx Binaries Path</label>
			<div class="controls">
				<input class="input input-xxlarge" id="sphinxbinpath" class="long" name="sphinxbinpath" type="text" value="{$fsite->sphinxbinpath}" />
				<span class="help-block">Path to directory where you installed the Sphinx binaries. If you leave this blank it will be assumed that they are installed to a location in your <code>PATH</code></span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sphinxsearchfields">Default Search Field(s)</label>
			<div class="controls">
				<input class="input input-xxlarge" id="sphinxsearchfields" class="long" name="sphinxsearchfields" type="text" value="{$fsite->sphinxsearchfields}" />
				<span class="help-block">Comma separated list of fields to search by default.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sphinxmergefreq">Merge Frequency</label>
			<div class="controls">
				Every day at <input class="input input-medium" class="tiny" id="sphinxmergefreq" name="sphinxmergefreq" type="text" value="{$fsite->sphinxmergefreq}" /> or 
				<input class="input input-medium" style="width: 40px" id="sphinxmergefreq_count" name="sphinxmergefreq_count" type="text" value="{$fsite->sphinxmergefreq_count}" /> records.
				<span class="help-block">Merge the delta indexes into the main indexes every day at at this time (24-hour format) or once the delta index grows above the given size.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="sphinxrebuildfreq">Rebuild Frequency</label>
			<div class="controls">
				Every {html_options id="sphinxrebuildfreq_day" name='sphinxrebuildfreq_day' values=$sphinxrebuildfreqday_days output=$sphinxrebuildfreqday_days selected=$fsite->sphinxrebuildfreq_day} at
				<input class="input input-medium" class="tiny" id="sphinxrebuildfreq" name="sphinxrebuildfreq" type="text" value="{$fsite->sphinxrebuildfreq}" />
				<span class="help-block">Day and time to do a full rebuild of the indexes (24-hour format).  Leave day empty to disable automatic rebuilding.</span>
			</div>
		</div>
	</fieldset>

	<fieldset>
		<legend>cURL Proxy Settings</legend>

		<div class="control-group">
			<label class="control-label" for="curlproxyaddress">Address/Port</label>
			<div class="controls">
				<input class="input input-xxlarge" id="curlproxyaddress" class="medium" name="curlproxyaddress" type="text" value="{$fsite->curlproxyaddress}" />
				<span class="help-block">eg. 127.0.0.1:8118</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="curlproxytype">Type</label>
			<div class="controls">
				{html_options class="curlproxytype input input-xxlarge" id="curlproxytype" name='curlproxytype' values=$curlproxytype_names output=$curlproxytype_names selected=$fsite->curlproxytype}
				<span class="help-block">Select HTTP for Tor/Polipo configuration.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="curlproxyuserpwd">Username/Password</label>
			<div class="controls">
				<input class="input input-xxlarge" id="curlproxyuserpwd" class="medium" name="curlproxyuserpwd" type="text" value="{$fsite->curlproxyuserpwd}" />
				<span class="help-block">eg. username:password</span>
			</div>
		</div>

	</fieldset>

	<fieldset>
		<legend>User Settings</legend>

		<div class="control-group">
			<label class="control-label" for="registerstatus">Registration Status</label>
			<div class="controls">
				{html_radios id="registerstatus" name='registerstatus' values=$registerstatus_ids output=$registerstatus_names selected=$fsite->registerstatus separator=''}
				<span class="help-block">The status of registrations to the site.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="storeuserips">Store User Ip</label> 
			<div class="controls">
				{html_radios id="storeuserips" name='storeuserips' values=$yesno_ids output=$yesno_names selected=$fsite->storeuserips separator=''}
				<span class="help-block">Whether to store the users ip address when they signup or login.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="userdownloadpurgedays">User Downloads Purge Days</label>
			<div class="controls">
				<input class="input input-xxlarge" id="userdownloadpurgedays" class="short" name="userdownloadpurgedays" type="text" value="{$fsite->userdownloadpurgedays}" />
				<span class="help-block">The number of days to preserve user download history, for use when checking limits being hit. 
					<br/>Set to zero will remove all records of what users download, but retain history of when, so that role based limits can still be applied.</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="userhostexclusion">IP Whitelist</label>
			<div class="controls">
				<input class="input input-xxlarge" id="userhostexclusion" class="medium" name="userhostexclusion" type="text" value="{$fsite->userhostexclusion}" />
				<span class="help-block">A comma separated list of IP addresses which will be excluded from user limits on number of requests and downloads per IP address. 
					<br/>Include values for google reader and other shared services which may be being used.</span>
			</div>
		</div>
	</fieldset>

	<fieldset>
		<legend>Recaptcha</legend>

		<div class="control-group">
			<label class="control-label" for="recaptchapublickey">ReCaptcha Public Key</label>
			<div class="controls">
				<input class="input input-xxlarge" id="recaptchapublickey" class="medium" name="recaptchapublickey" type="text" value="{$fsite->recaptchapublickey}" />
				<span class="help-block">The public key supplied by recaptcha.net. Sign up for recaptcha at <a href="https://www.google.com/recaptcha/admin/create">https://www.google.com/recaptcha/admin/create</a></span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="recaptchaprivatekey">ReCaptcha Private Key</label>
			<div class="controls">
				<input class="input input-xxlarge" id="recaptchaprivatekey" class="medium" name="recaptchaprivatekey" type="text" value="{$fsite->recaptchaprivatekey}" />
				<span class="help-block">The private key supplied by recaptcha.net</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="registerrecaptcha">Register Recaptcha</label>
			<div class="controls">
				{html_radios id="registerrecaptcha" name='registerrecaptcha' values=$yesno_ids output=$yesno_names selected=$fsite->registerrecaptcha separator=''}
				<span class="help-block">Whether to display a ReCaptcha captcha for registering.</span>
			</div>
		</div>
	</fieldset>

	<div class="control-group">
		<label class="control-label"> </label>
		<div class="controls">
			<input class="btn btn-warning" type="submit" value="Save Site Settings" />
		</div>
	</div>


</form>

