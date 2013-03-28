{if $donated || $less}
    <h1>Thank you!</h1>
    We just really wanted to say thank you for supporting us. This site is completely hosted out of pocket for our admin teams and every dollar you contribute helps us to pay for bandwidth, servers and generally keep things running smoothly. 
    <br />
    Thank you again!<br />
    <br />
    {if $less}
        Although it looks as if your last donation was less than the average amount of<span class="label">${$donate_avg|number_format:2:".":","}</span>, and as such we have not modified or changed your account in any way, we still really appreciate all of the help we receive from the community! You are what makes us successfull. If you'd like to donate more than the average, we'd be happy to show our appreication for your donation by unlocking all of the following:<br />
    {else}
        We understand you may be coming back here to view what donating has earned you, or to donate again... so here's what donating has entitled you to:<br />
    {/if}
{else}

    <h1>Donations</h1>

    We beleive in paying for services that we value, but everyone values the services they use, differently. To get around this, we let you show us how much you value our service by donating any amount to us. If you donate more than the average, we'll unlock a bunch of stuff for you. Seems simple right? We like to think so too... <br /><br />By donating more than: <span class="label">${$donate_avg|number_format:2:".":","}</span> you'll unlock all of the features below.

{/if}
<ul>
	<li><strong>Previews:</strong> You can now view the content before downloading the nzb. This means that audio files will have 10 seconds of audio, movies and tv shows will have a screenshot. No more downloading just to find out it was misslabeled on usenet.</li>
	<li><strong>Removal of ads:</strong> We hate them just as much as you, but the site needs them to stay afloat. That being said, once you've donated to us, we might be able to subsidize our costs a little with your help! As a sign of appreciation, we'll hide those ads for you entirely.</li>
	<li><strong>Real Time RSS:</strong> You may not have noticed, but the Bookmarks RSS and other RSS is actually on a 10 minute cache rotation. We'll remove that cache and request the most up to date information from the database every time you hit it, once you donate.</li>
	<li><strong>Flood Limitation Removal:</strong> We remove the request limit of 3 requests for 5 seconds once you donate. Just another way of us saying thank you!</li>
	<li><strong>SSL:</strong> Enjoy the site, with increased confidence in security.</li>
	<li><strong>MOAR INVITES!</strong> Every time you donate we'll top you back up to 20 invites to spread around to all your friends... This helps us grow, and it helps you include your friends.</li>
	<li><strong>Warm Fuzzies:</strong> these cannot be garuanteed, though if donating to a not-for-profit like us doesn't make you feel good, then I dont know what else to offer you.</li>
</ul>

<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
    <input type="hidden" name="cmd" value="_donations">
    <input type="hidden" name="business" value="AFDF2B8D368PS">
    <input type="hidden" name="lc" value="CA">
    <input type="hidden" name="item_name" value="WritheM News Donation [{$userdata.username}]">
    <input type="hidden" name="item_number" value="{$userdata.ID}">
    <input type="hidden" name="no_note" value="0">
    <input type="hidden" name="cn" value="Anything you'd like to tell us?">
    <input type="hidden" name="no_shipping" value="1">
    <input type="hidden" name="currency_code" value="CAD">
    <input type="hidden" name="return" value="http://news.writhem.com/donate">
    <input type="hidden" name="rm" value="2">
    <input type="hidden" name="bn" value="PP-DonationsBF:btn_donate_SM.gif:NonHosted">
    <div class="input-prepend input-append">
        <span class="add-on">$</span>
        <input class="span1" type="text" name="amount" value="{$donate_avg|number_format:2:".":"," + 1}">
        <button class="btn" type="submit">Donate Now{if isadmin} (prod){/if}</button>
    </div>
</form>

{if isadmin}
<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
    <input type="hidden" name="cmd" value="_donations">
    <input type="hidden" name="business" value="7QX7AR86NGYHG">
    <input type="hidden" name="lc" value="CA">
    <input type="hidden" name="item_name" value="WritheM News Donation [{$userdata.username}]">
    <input type="hidden" name="item_number" value="{$userdata.ID}">
    <input type="hidden" name="no_note" value="0">
    <input type="hidden" name="cn" value="Anything you'd like to tell us?">
    <input type="hidden" name="no_shipping" value="1">
    <input type="hidden" name="currency_code" value="CAD">
    <input type="hidden" name="return" value="http://news.writhem.com/donate">
    <input type="hidden" name="rm" value="2">
    <div class="input-prepend input-append control-group warning">
        <span class="add-on">$</span>
        <input class="span1" type="text" name="amount" value="{$donate_avg|number_format:2:".":"," + 1}">
        <button class="btn btn-danger" type="submit">Donate Now (test)</button>
    </div>
</form>
{/if}