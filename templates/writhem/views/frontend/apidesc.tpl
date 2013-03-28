<div class="page-header">
	<h1>{$page->title}</h1>
</div>

{if $site->apienabled != "1"}

<div class="alert">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Sorry!</strong>
	The api is currently disabled. <a href="{$smarty.const.WWW_TOP}/contact-us">Contact us</a> if you require api access.
</div>		

{else}

<p>
	Here lives the documentation for the api for accessing nzb and index data. Api functions can be
	called by either logged in users, or by providing an apikey.
</p>

{if $loggedin=="true"}
<p>
	Your credentials should be provided as <code>?apikey={$userdata.rsstoken}</code>
</p>
{/if}

<h2>Available Functions</h2>
<p>Use the parameter <code>?t=</code> to specify the function being called.</p>

<h3>Server Functions</h3>
<ul>
	<li>
		<b>Capabilities</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=caps">?t=caps</a></code>
		<br/>
		Reports the capabilities if the server. Includes information about the server name, available search categories and version number of the newznab protocol being used.
		<br/>
		Capabilities does not require any credentials in order to be ran.
	</li>	
</ul>

<h3>User Functions</h3>
<ul>
	<li>
		<b>Register</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=register">?t=register&amp;email=user@newznab.com</a></code>
		<br/>
		Registers a new user account. Does not require any credentials in order to be ran.
		<br/>
		Returns either the registered username and password if successful or an error code.
	</li><br/>	

	<li>
		<b>User</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=user">?t=user&amp;username=user123</a></code>
		<br/>
		Returns public information about a user.
		<br/>
		Returns either the user information or an error code.
	</li><br/>		

	<li>
		<b>Cart</b> <code><a href="{$smarty.const.WWW_TOP}/rss?t=-2">rss?t=-2&amp;del=1</a></code>
		<br/>
		Returns the items in a users cart in the form of an rss feed. The optional parameter <code>&amp;del=1</code> will remove the items from the cart after the feed is requested.
	</li><br/>					

	<li>
		<b>CartAdd</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=cartadd&amp;id=9ca52909ba9b9e5e6758d815fef4ecda">?t=cartadd&amp;id=9ca52909ba9b9e5e6758d815fef4ecda</a></code>
		<br/>
		Adds an nzb to a users cart.
	</li><br/>					

	<li>
		<b>CartDelete</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=cartdel&amp;id=9ca52909ba9b9e5e6758d815fef4ecda">?t=cartdel&amp;id=9ca52909ba9b9e5e6758d815fef4ecda</a></code>
		<br/>
		Remove an nzb from a users cart.
	</li><br/>					
</ul>

<h3>Search Functions</h3>
<ul>
	<li>
		<b>Search</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=search&amp;q=linux">?t=search&amp;q=linux</a></code>
		<br/>
		Returns a list of nzbs matching a query. You can also  filter by site category or group name by including a comma separated list as follows <code><a href="{$smarty.const.WWW_TOP}/api?t=search&amp;cat=1000,2000&amp;group=a.b.multimedia">?t=search&amp;cat=1000,2000&amp;group=a.b.multimedia</a></code>. Include <code>&amp;extended=1</code> to return extended information in the search results.
	</li><br/>
	<li>
		<b>TV</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=tvsearch&amp;q=beverly%20hillbillies&amp;season=1&amp;ep=1">?t=tvsearch&amp;q=beverly%20hillbillies&amp;season=1&amp;ep=1</a></code>
		<br/>
		Returns a list of nzbs matching a query, category, tvrageid, season or episode. You can also filter by site category by including a comma separated list of categories as follows <code><a href="{$smarty.const.WWW_TOP}/api?t=tvsearch&amp;rid=2204&amp;cat=1000,2000">?t=tvsearch&amp;rid=2204&amp;cat=1000,2000</a></code>.  Include <code>&amp;extended=1</code> to return extended information in the search results.
	</li><br/>
	<li>
		<b>Movies</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=movie&amp;imdbid=0023010">?t=movie&amp;imdbid=0023010</a></code>
		<br/>
		Returns a list of nzbs matching a query, an imdbid and optionally a category or genre. Filter by site category by including a comma separated list of categories as follows <code><a href="{$smarty.const.WWW_TOP}/api?t=movie&amp;imdbid=0023010&amp;cat=2030,2040&amp;genre=Romance">?t=movie&amp;imdbid=0023010&amp;cat=2030,2040&amp;genre=Romance</a></code>.  Include <code>&amp;extended=1</code> to return extended information in the search results.
	</li><br/>
	<li>
		<b>Music</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=music&amp;artist=Jack">?t=music&amp;artist=Jack</a></code>
		<br/>
		Returns a list of nzbs matching an audio based query and optionally a category. Filter by site category by including a comma separated list of categories as follows <code><a href="{$smarty.const.WWW_TOP}/api?t=music&amp;artist=Jack&amp;cat=2030,2040">?t=music&amp;artist=Jack&amp;cat=2030,2040</a></code>.  Include <code>&amp;extended=1</code> to return extended information in the search results. Other search parameters include artist, album, label, year, genre (supports comma separated list).
	</li><br/>
	<li>
		<b>Book</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=book&amp;author=Daniel">?t=book&amp;author=Daniel</a></code>
		<br/>
		Returns a list of nzbs matching a book based query. Include <code>&amp;extended=1</code> to return extended information in the search results. Other search parameters include title.
	</li><br/>
	<li>
		<b>Details</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=details&amp;id=9ca52909ba9b9e5e6758d815fef4ecda">?t=details&amp;id=9ca52909ba9b9e5e6758d815fef4ecda</a></code>
		<br/>
		Returns detailed information about an nzb.
	</li><br/>	
	<li>
		<b>GetNfo</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=getnfo&amp;id=9ca52909ba9b9e5e6758d815fef4ecda">?t=getnfo&amp;id=9ca52909ba9b9e5e6758d815fef4ecda</a></code>
		<br/>
		Returns an nfo file for an nzb. Optional parameter <code>&amp;raw=1</code> returns just the nfo file without the rss container.
	</li><br/>
	<li>
		<b>Comments</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=comments&amp;id=9ca52909ba9b9e5e6758d815fef4ecda">?t=comments&amp;id=9ca52909ba9b9e5e6758d815fef4ecda</a></code>
		<br/>
		Returns comments for an nzb.
	</li><br/>						
</ul>

<h3>NZB Functions</h3>
<ul>
	<li>
		<b>Get</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=get&amp;id=9ca52909ba9b9e5e6758d815fef4ecda">?t=get&amp;id=9ca52909ba9b9e5e6758d815fef4ecda</a></code>
		<br/>
		Downloads the nzb file associated with an Id.
	</li><br/>
	<li>
		<b>CommentAdd</b> <code><a href="{$smarty.const.WWW_TOP}/api?t=commentadd&amp;id=9ca52909ba9b9e5e6758d815fef4ecda&amp;text=comment">?t=comments&amp;id=9ca52909ba9b9e5e6758d815fef4ecda&amp;text=comment</a></code>
		<br/>
		Adds a comment to an nzb.
	</li><br/>
</ul>

<h2>Output Format</h2>
<p>Obviously not appropriate to functions which return an nzb file.</p>
<ul>
	<li>
		Xml (default) <code>?t=search&amp;q=linux&amp;o=xml</code>
		<br/>
		Returns the data in an xml document.
	</li><br/>
	<li>
		Json <code>?t=search&amp;q=linux&amp;o=json</code>
		<br/>
		Returns the data in a json object.
	</li><br/>						
</ul>

<h2>Extended Attributes</h2>
<p>Using the attrs tag and a comma separated list of supported values, extended information can be returned in the search results. <br/>For example <code>?attrs=files,poster,group</code>. Note that not every attribute is available for every release type. Below is a list of some of the supported attributes. To return all known attributes per release use the parameter <code>?extended=1</code>. See the API specification for a full list.</p> 
<ul>
	<li>files</li>          
	<li>poster</li>         
	<li>group </li>         
	<li>team  </li>         
	<li>grabs </li>         
	<li>password  </li>     
	<li>comments  </li>     
	<li>usenetdate </li>    
	<li>info    </li>       
	<li>year   </li>        
	<li>season  </li>       
	<li>episode </li>       
	<li>rageid </li>        
	<li>tvtitle  </li>      
	<li>tvairdate </li>     
	<li>video  </li>        
	<li>audio  </li>        
	<li>resolution </li>    
	<li>framerate</li>      
	<li>language  </li>     
	<li>subs    </li>       
	<li>imdb   </li>        
	<li>imdbscore </li>     
	<li>imdbtitle  </li>    
	<li>imdbtagline   </li> 
	<li>imdbplot </li>      
	<li>imdbyear   </li>    
	<li>imdbdirector  </li> 
	<li>imdbactors</li>     
	<li>genre   </li>       
	<li>artist  </li>       
	<li>album </li>         
	<li>publisher </li>     
	<li>tracks  </li>       
	<li>coverurl  </li>     
	<li>backdropcoverurl</li>
	<li>review   </li>      					
</ul>

{/if}
