<?php

/*
 | --------------------------------------------------------------------
 | NAILS MAIN APPLICATION
 | --------------------------------------------------------------------
 |
 | This is the kick off point for the main Nails Application.
 |
 | Lead Developer: Pablo de la Peña	(p@shedcollective.org, @hellopablo)
 | Lead Developer: Gary Duncan		(g@shedcollective.org, @gsdd)
 |
 | Documentation: http://docs.nailsapp.co.uk
 |
 | CodeIgniter version: v2.1.0
 |
 |
 | --------------------------------------------------------------------
 | APP SETTINGS
 | --------------------------------------------------------------------
 |
 | Load app specific settings.
 |
 |
 */
		$_styles = <<<EOT

			<style type="text/css">

				p {font-family:monospace;margin:20px 10px;}
				strong { color:red;}
				code { padding:5px;border:1px solid #CCC;background:#EEE }

			</style>

EOT;

 	if ( ! file_exists( dirname(__FILE__) . '/settings/app.php' ) ) :

 		if ( isset( $_SERVER['SCRIPT_NAME'] ) ) :

 			$_location  = dirname( $_SERVER['SCRIPT_NAME'] );
 			$_location .= substr( $_location, -1 ) != '/' ? '/' : '';

	 		header( 'Location: ' . $_location . 'nails-install.php' );
		 	exit( 0 );

 		else :

			echo $_styles;
			echo '<p><strong>ERROR:</strong> Missing settings/app.php; please run installer.</p>';
			exit( 0 );

 		endif;

	endif;

 	require dirname(__FILE__) . '/settings/app.php';


 /*
 | --------------------------------------------------------------------
 | DEPLOY SETTINGS
 | --------------------------------------------------------------------
 |
 | Load environment specific settings.
 |
 |
 */
 	if ( ! file_exists( dirname(__FILE__) . '/settings/deploy.php' ) ) :

 		if ( isset( $_SERVER['SCRIPT_NAME'] ) ) :

 			$_location  = dirname( $_SERVER['SCRIPT_NAME'] );
 			$_location .= substr( $_location, -1 ) != '/' ? '/' : '';

	 		header( 'Location: ' . $_location . 'nails-install.php' );
		 	exit( 0 );

 		else :

			echo $_styles;
			echo '<p><strong>ERROR:</strong> Missing settings/deploy.php; please run installer.</p>';
			exit( 0 );

 		endif;

	endif;

 	require dirname(__FILE__) . '/settings/deploy.php';


 /*
 | --------------------------------------------------------------------
 | GLOBAL CONSTANTS
 | --------------------------------------------------------------------
 |
 | These global constants need defined early on, unless specified already
 | defined in app.php or deploy.php define the defaults.
 |
 */

	if ( ! defined( 'NAILS_PATH' ) )	define( 'NAILS_PATH', dirname( __FILE__ ) . '/vendor/shed/nails/' );


 /*
 | --------------------------------------------------------------------
 | TEST NAILS AVAILABILITY
 | --------------------------------------------------------------------
 |
 | Load environment specific settings.
 |
 |
 */
 	if ( ! file_exists( NAILS_PATH . 'core/CORE_NAILS_Controller.php' ) ) :

		echo $_styles;
		echo '<p><strong>ERROR:</strong> Cannot find a valid Nails installation.</p>';
		exit( 0 );

	endif;

 	require dirname(__FILE__) . '/settings/deploy.php';

 /*
 | --------------------------------------------------------------------
 | MAINTENANCE MODE
 | --------------------------------------------------------------------
 |
 | Halt execution if maintenance mode is enabled. IP's listed in the
 | whitelist will be unaffected. Headers tell spiders to retry in 2 hours.
 |
 |
 */

 	if ( defined( 'MAINTENANCE_MODE' ) && MAINTENANCE_MODE ) :

		$whitelist_ip = explode(',', MAINTENANCE_WHITELIST );

		if ( array_search( $_SERVER['REMOTE_ADDR'], $whitelist_ip ) === FALSE ) :

			header( 'HTTP/1.1 503 Service Temporarily Unavailable' );
			header( 'Status: 503 Service Temporarily Unavailable' );
			header( 'Retry-After: 7200' );

			// --------------------------------------------------------------------------

	 		//	Look for an app override
	 		if ( file_exists( dirname(__FILE__) . '/application/views/maintenance/maintenance.php' ) ) :

	 			require dirname(__FILE__) . '/application/views/maintenance/maintenance.php';

	 		//	Fall back to the Nails maintenance page
	 		elseif ( file_exists( NAILS_PATH . 'views/maintenance/maintenance.php' ) ):

	 			require NAILS_PATH . 'views/maintenance/maintenance.php';

	 		//	Fall back, back to plain text
	 		else :

	 			echo '<h1>Down for maintenance</h1>';

	 		endif;

	 		// --------------------------------------------------------------------------

	 		//	Halt script execution
 			exit(0);

	 	endif;

	endif;


 /*
 | --------------------------------------------------------------------
 | ERROR REPORTING
 | --------------------------------------------------------------------
 |
 | Different environments will require different levels of error reporting.
 |
 | Heads-up: CI intercepts native error handling so to suppress errors from
 | the output make sure this is set to 0 (errors will still be logged in the
 | application's error logs however).
 |
 |
 */

 	switch( ENVIRONMENT ) :

 		case 'production' :

 			//	Suppress all errors on production
 			error_reporting( 0 );

 		break;

 		// --------------------------------------------------------------------------

 		default :

 			//	Show errors everywhere else
 			error_reporting( E_ALL|E_STRICT );

 		break;

 	endswitch;


 /*
 | --------------------------------------------------------------------
 | CODEIGNITER
 | --------------------------------------------------------------------
 |
 | Load up the Main CodeIgniter index file
 |
 */

 	require dirname(__FILE__) . '/index.ci.php';