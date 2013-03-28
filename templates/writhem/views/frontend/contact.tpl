			<h1>{$page->title}</h1>
			<h2>Getting in touch</h2>
			<p>
				Please send any questions or comments you have in an email to {mailto address=$site->email text=$site->title}.
			</p>

			{$msg}

			{if $msg == ""}
			<h2>Contact form</h2>
			<p>
				Alternatively use our contact form to get in touch.
			</p>
			
			<form method="post" action="contact-us">
				<table>
					<tr>
						<td width="100px"><label for="username">Your name:</label></td>
						<td>
							<div class="input input-prepend">
								<span class="add-on"><i class="icon-user"></i> </span>
								<input class="span3" id="username" type="text" name="username" required />
							</div>
						</td>
					</tr>
					<tr>
						<td><label for="useremail">Your email address:</label></td>
						<td>
							<div class="input-prepend">
								<span class="add-on"><i class="icon-envelope"></i></span>
								<input class="span3" type="email" id="useremail" name="useremail" required />
							</div>
						</td>
					</tr>
					<tr>
						<td><label for="comment">Your comment or review:</label></td>
						<td>
							<textarea class="span4" rows="10" cols="40" id="comment" name="comment" required></textarea>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="submit" value="Submit" />
						</td>
					</tr>
				</table>
			</form>

			{/if}
