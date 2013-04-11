<div class="span6 offset1" 
style="
background-color:#d9edf7; 
padding:40px;
background-color: #f7f7f9;
border: 1px solid #e1e1e8;
  -webkit-border-radius: 4px;
     -moz-border-radius: 4px;
          border-radius: 4px;
"> 
 
<h1>{$page->title}</h1>

{if $error != ''}
	<div class="error">{$error}</div>
{/if}

{if $confirmed == '' && $sent == ''}
	<p>
		Please enter the email address you used to register and we will send an email to reset your password. If you cannot remember your email, or no longer have access to it, please <a href="{$smarty.const.WWW_TOP}/contact-us">contact us</a>.
	</p>

	<form method="post" action="forgottenpassword?action=submit">

		<table class="data">
			<tr><th></th>
          <div class="input-prepend">
            <label for="email" class="add-on"><i class="icon-envelope"></i></label>
            <input class="span5" id="email" required autocomplete="off" name="email" value="{$email}" type="email"/>
          </div>
				</td>
			</tr>
			<tr>
        <th></th>
        <td><input class="btn" type="submit" value="Request Password Reset" /></td>
      </tr>
		</table>
	</form>
{elseif $sent != ''}
	<p>
		A password reset request has been sent to your email.
	</p>
{else}
	<p>
		Your password has been reset and sent to you in an email.
	</p>
{/if}
	
</div>
