<?php
 /*
 | --------------------------------------------------------------------
 | DEPLOY SETTINGS
 | --------------------------------------------------------------------
 | 
 | Deployment specific settings.
 | 
 | Location: [Name of deployment server/location]
 | 
 | 
 | --------------------------------------------------------------------
 | APPLICATION ENVIRONMENT
 | --------------------------------------------------------------------
 | 
 | You can load different configurations depending on your
 | current environment. Setting the environment also influences
 | things like logging and error reporting.
 |
 */
	define( 'ENVIRONMENT', '{{VALUE_DEPLOY_ENVIRONMENT}}' );
	
	
/*
 | --------------------------------------------------------------------
 | NAILS PATH
 | --------------------------------------------------------------------
 | 
 | The path to the Nails package. Trailing slash please; make sure this
 | begins with FCPATH.
 |
 */
	define( 'NAILS_PATH', '{{VALUE_DEPLOY_NAILS_PATH}}' );
	
	
/*
 | --------------------------------------------------------------------
 | NAILS ASSETS URL
 | --------------------------------------------------------------------
 | 
 | The URL to where the Nails assets folder is. Normally this can be the
 | remote folder used by the main Nails site however it may be desireable
 | to load the files from elsewhere (such as from the APP).
 | 
 | Remote URL: http://nails.shedcollective.org/assets/nails/
 | 
 | WITH trailing slash, please.
 |
 */
	define( 'NAILS_URL', '{{VALUE_DEPLOY_NAILS_URL}}' );
	
	
/*
 | --------------------------------------------------------------------
 | ERROR REPORTING
 | --------------------------------------------------------------------
 | 
 | Different environments will require different levels of error reporting.
 |
 */
	error_reporting( {{VALUE_DEPLOY_ERROR_REPORTING}} );
	
	
 /*
 | --------------------------------------------------------------------
 | PROFILING
 | --------------------------------------------------------------------
 | 
 | Define whether to enable profiling or not.
 |
 */
	define( 'PROFILING', {{VALUE_DEPLOY_PROFILING}} );
	
	
 /*
 | --------------------------------------------------------------------
 | EMAIL OVERRIDE
 | --------------------------------------------------------------------
 | 
 | When not running on a production server all outgoing mail will be
 | sent to this address, prevents any accidental sending to live users
 |
 */
	define( 'EMAIL_OVERRIDE',	'{{VALUE_DEPLOY_EMAIL_OVERRIDE}}' );
	define( 'EMAIL_DEBUG',		FALSE );
	
	
 /*
 | --------------------------------------------------------------------
 | BASE URL
 | --------------------------------------------------------------------
 | 
 | Define the base URL
 |
 */
	define( 'BASE_URL', '{{VALUE_DEPLOY_BASE_URL}}' );
	
	
 /*
 | --------------------------------------------------------------------
 | DEPLOY PRIVATE KEY
 | --------------------------------------------------------------------
 | 
 | Define the encryption key to use for this deployment. This will be
 | combined with the app's encryption key to ensure that all encrypted
 | data for this deployment is truly unique.
 |
 */
	define( 'DEPLOY_PRIVATE_KEY', '{{VALUE_DEPLOY_PRIVATE_KEY}}' );
	
	
/*
 | --------------------------------------------------------------------
 | DATABASE VARIABLES
 | --------------------------------------------------------------------
 */
	define( 'DB_HOST',		'{{VALUE_DATABASE_HOST}}' );
	define( 'DB_USERNAME',	'{{VALUE_DATABASE_USER}}' );
	define( 'DB_PASSWORD',	'{{VALUE_DATABASE_PASSWORD}}' );
	define( 'DB_DATABASE',	'{{VALUE_DATABASE_DATABASE}}' );
	define( 'DB_DEBUG',		TRUE );
	
	
/*
 | --------------------------------------------------------------------
 | EMAIL VARIABLES
 | --------------------------------------------------------------------
 */
	define( 'SMTP_HOST',		'{{VALUE_SMTP_HOST}}' );
	define( 'SMTP_USERNAME',	'{{VALUE_SMTP_USER}}' );
	define( 'SMTP_PASSWORD',	'{{VALUE_SMTP_PASS}}' );
	define( 'SMTP_PORT',		'{{VALUE_SMTP_PORT}}' );
	
	
 /*
 | --------------------------------------------------------------------
 | CDN SERVER
 | --------------------------------------------------------------------
 |
 | The name of the CDN server if available. Trailing slash please.
 | 
 | CDN_LIBRARY	- Which CDN driver to use, default is LOCAL.
 | CDN_MAGIC	- The location of the mimetypes file - for magical mimetype conversions
 | CDN_SERVER	- The publically accessible URL of the CDN server, only used by LOCAL driver.
 | CDN_PATH		- The absolute path to the CDN, only used by LOCAL driver.
 |
 */
	define( 'CDN_DRIVER',	'{{VALUE_DEPLOY_CDN_DRIVER}}' );
	define( 'CDN_MAGIC',	'{{VALUE_DEPLOY_CDN_MAGIC}}' );
	
	//	Local CDN variables
 	define( 'CDN_SERVER',	'{{VALUE_DEPLOY_CDN_URL}}' );
 	define( 'CDN_PATH',		'{{VALUE_DEPLOY_CDN_PATH}}' );
 	
 	
/*
 | --------------------------------------------------------------------
 | MAINTENANCE MODE
 | --------------------------------------------------------------------
 */
	define( 'MAINTENANCE_MODE',			FALSE );
	define( 'MAINTENANCE_WHITELIST',	'127.0.0.1' );
 	
 	
/* End of file deploy.php */
/* Location: ./settings/deploy.php */