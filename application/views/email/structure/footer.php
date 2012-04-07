									</td>
								</tr>
								<?php if ( ! isset( $hide_signoff ) ) : ?>
								<tr>
									<td colspan="2">
										<p style="margin-top:15px;">
											Bye for now!
										</p>
									</td>
								</tr>
								<tr>
									<td valign="middle" class="small">
										<p>
											<img src="<?=site_url( 'assets/email/templates/2012-02/sig.png' )?>" width="206" height="37" />
										</p>
									</td>
									<td align="right" valign="bottom" class="small" style="color:#ccc;">
										<p>
										<?php
										
											if ( isset( $email_ref ) )
												echo 'Email Ref: ' . $email_ref;
										?>
										</p>
									</td>
								</tr>
								<?php endif; ?>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table class="padding" style="background:#fafafa;border-top:1px solid #aaa;margin-top:20px;padding-bottom:10px;border-bottom:1px solid #aaa;padding-bottom:20px;margin-bottom:50px;" bgcolor="#fff" width="590" align="center" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="4" class="small">
										<p>
											<strong>Intern Avenue</strong> provides a convenient touchpoint between interns and industry.
											To find out more about why and how, read <?=anchor( 'about', 'about Intern Avenue' )?>, our
											<?=anchor( 'about/faq', 'frequently asked questions' ) ?> or contact our <?=anchor( 'contact', 'press team' )?>.
										</p>
									</td>
								</tr>
								<tr>
									<td class="small footer" valign="middle">
										<p style="margin:0;">
											&copy; <?=date( 'Y' )?> Intern Avenue, all rights reserved
										</p>
									</td>
									<td class="small footer" valign="middle">
										<p style="margin:0;">
										<?php
										
										
											//	Unsubscribe Link
											if ( isset( $unsubscribe_url ) && ! empty( $unsubscribe_url ) ) :
											
												echo anchor( 'mini/' . shorten_url( $login_url . '?return_to='. urlencode( $unsubscribe_url ) ), 'Unsubscribe' ) . ' | ';
												
											endif;
											
											if ( isset( $input[0]['unsubscribe_url'] ) && ! empty( $input[0]['unsubscribe_url'] ) ) :
											
												echo anchor( 'mini/' . shorten_url( $input[0]['login_url'] . '?return_to=' . urlencode( $input[0]['unsubscribe_url'] ), 'Unsubscribe' ) ) . ' | ';
												
											endif;
											
											
											// --------------------------------------------------------------------------
											
											
											//	View Online link
											if ( isset( $email_ref ) ) :
											
												$_time = time();
												echo anchor( 'email/view_online/' . $email_ref . '/' . $_time . '/' . md5( $_time . $secret . $email_ref ), 'View Online' );
												
											endif;
											
										?>
										</p>
									</td>
									<td class="small footer">
										<p style="margin:0;">
											<a href="https://www.facebook.com/internavenue" style="border:none;position:relative;top:4px;"><img src="<?=site_url( 'assets/email/templates/2012-02/facebook.png' )?>" border="0" width="24" height="24" /></a>
											<a href="https://twitter.com/internavenue" style="border:none;position:relative;top:4px;"><img src="<?=site_url( 'assets/email/templates/2012-02/twitter.png' )?>" border="0" width="24" height="24" /></a>
										</p>
									</td>
									<td align="right" valign="middle" class="small footer">
										<a href="<?=site_url()?>">
											<img src="<?=site_url( 'assets/email/templates/2012-02/logo.png' )?>" border="0" width="80" height="41" />
										</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
				
			</table>
			
		</div>
	
	</body>
</html>