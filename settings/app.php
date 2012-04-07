<?php
 /*
 | --------------------------------------------------------------------
 | APP SETTINGS
 | --------------------------------------------------------------------
 | 
 | App specific settings; these are settings which are consistant across
 | deployments but which might differ between Nails installations.
 | 
 | 
 | 
 | --------------------------------------------------------------------
 | APP PRIVATE KEY
 | --------------------------------------------------------------------
 | 
 | Define the private key to use for this app. This should, as the
 | name suggests, be kept very private. This secret will be combined
 | with the deployment secret so that all encryptions truly are unique
 | to the instance of the app in question.
 |
 */
	define( 'APP_PRIVATE_KEY', '1234567890' );
	
	
 /*
 | --------------------------------------------------------------------
 | SITE NAME
 | --------------------------------------------------------------------
 | 
 | The public facing name of this app.
 |
 */
	define( 'APP_NAME',	'Nails.' );
	
	
 /*
 | --------------------------------------------------------------------
 | EMAIL DEFAULTS
 | --------------------------------------------------------------------
 | 
 | Define the defaults for email sent from this application.
 |
 */
	define( 'APP_EMAIL_FROM_NAME',	'Shed Collective' );
	define( 'APP_EMAIL_FROM_EMAIL',	'hello@shedcollective.org' );

	
	
 /*
 | --------------------------------------------------------------------
 | APP NAILS MODULES
 | --------------------------------------------------------------------
 | 
 | A comme deliminated list of Nails modules to enable for this app.
 | By listing the module name here the module will be available to the
 | app and will appear in the app's administration.
 | 
 | Default modules will always be enabled. These are:
 |
 | auth,admin
 |
 */
	define( 'APP_NAILS_MODULES',	'accounts' );


	
/* End of file app.php */
/* Location: ./public_html/settings/app.php */