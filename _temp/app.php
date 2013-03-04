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
	define( 'APP_PRIVATE_KEY', '{{VALUE_APP_PRIVATE_KEY}}' );
	
	
 /*
 | --------------------------------------------------------------------
 | SITE NAME
 | --------------------------------------------------------------------
 | 
 | The public facing name of this app.
 |
 */
	define( 'APP_NAME',	'{{VALUE_APP_NAME}}' );
	
	
 /*
 | --------------------------------------------------------------------
 | EMAIL DEFAULTS
 | --------------------------------------------------------------------
 | 
 | Define the defaults for email sent from this application and the
 | email which should receive any error notifications
 |
 */
	define( 'APP_EMAIL_FROM_NAME',	'{{VALUE_APP_EMAIL_FROM_NAME}}' );
	define( 'APP_EMAIL_FROM_EMAIL',	'{{VALUE_APP_EMAIL_FROM_EMAIL}}' );
	define( 'APP_EMAIL_DEVELOPER',	'{{VALUE_APP_EMAIL_DEVELOPER}}' );

	
	
 /*
 | --------------------------------------------------------------------
 | APP NAILS MODULES
 | --------------------------------------------------------------------
 | 
 | A comma deliminated list of Nails modules to enable for this app.
 | By listing the module name here the module will be available to the
 | app and will appear in the app's administration; include custom controllers
 | specific to this app (these should be placed at modules/admin/controllers).
 | 
 | Define submodules to enable using pipe seperated values within square brackets
 | i.e auth[facebook|twitter],admin[accounts|custom_controller|utilities]
 |
 */
	define( 'APP_NAILS_MODULES',	'{{VALUE_APP_NAILS_MODULES}}' );
 	
 	
/*
 | --------------------------------------------------------------------
 | SSL ROUTING
 | --------------------------------------------------------------------
 | 
 | Whether to enable SSL routing or not for this app (only effective
 | on production).
 | 
 */
	define( 'SSL_ROUTING', FALSE );


	
/* End of file app.php */
/* Location: ./public_html/settings/app.php */