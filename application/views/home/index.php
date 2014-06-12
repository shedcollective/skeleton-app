<div class="row">
	<div class="jumbotron <?=BS_COL_XS_12?> <?=BS_COL_SM_12?> <?=BS_COL_MD_10?> <?=BS_COL_MD_OFFSET_1?> <?=BS_COL_LG_8?> <?=BS_COL_LG_OFFSET_2?>">
		<h3>
			So, it looks like your app is up and running nicely!
		</h3>
		<p>
			Nice one buddy, proud of you.
		</p>
		<p>
			Next step is to get cracking and write some awesome code. Not sure where to start? <a href="http://docs.nailsapp.co.uk">The docs are always a good start</a>.
		</p>
		<hr />
		<p class="text-center">
		<?php

			if ( $user->is_logged_in() ) :

				echo anchor( 'auth/logout', lang( 'action_logout' ), 'class="btn btn-primary btn-lg"' );

			else :

				echo anchor( 'auth/login', lang( 'action_login' ), 'class="btn btn-primary btn-lg"' ) . ' ';
				echo app_setting( 'user_registration_enabled', 'app' ) ? anchor( 'auth/register', lang( 'action_register' ), 'class="btn btn-default btn-lg"' ) : '';

			endif;

		?>
		</p>
	</div>
</div>