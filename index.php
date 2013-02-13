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
 | Current release:		v2.4.1
 | Released on:			16th March 2012 @ 18:12
 | Release notes:		http://nails.shedcollective.org/release-notes/
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
 	if ( ! file_exists( './settings/app.php' ) ) :
 	
 		header( 'HTTP/1.1 500 Bad Request' );
		die( 'ERROR: No app settings file.' );
	
	endif;
	
 	require './settings/app.php';
 	
 	
 /*
 | --------------------------------------------------------------------
 | DEPLOY SETTINGS
 | --------------------------------------------------------------------
 | 
 | Load environment specific settings.
 |
 |
 */
 	if ( ! file_exists( './settings/deploy.php' ) ) :
 	
 		header( 'HTTP/1.1 500 Bad Request' );
		die( 'ERROR: No environment settings file.' );
	
	endif;
	
 	require './settings/deploy.php';
 	
 	
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
	 		if ( file_exists( './application/views/maintenance/maintenance.php' ) ) :
	 		
	 			include './application/views/maintenance/maintenance.php';
	 		
	 		//	Fall back to the Nails maintenance page
	 		elseif ( file_exists( NAILS_PATH . 'views/maintenance/maintenance.php' ) ):
	 		
	 			include NAILS_PATH . 'views/maintenance/maintenance.php';
	 		
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
 | TIMEZONE SETTING
 | --------------------------------------------------------------------
 | 
 | Set the timezone here for ease; make sure all date/time functions
 | behave as expected. London, London, ra, ra, ra!
 |
 |
 */
 	ini_set( 'date.timezone', 'Europe/London' );
 	
 	
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
			define( 'DB_DEBUG', FALSE );
 		
 		break;
 		
 		// --------------------------------------------------------------------------
 		
 		default :
 		
 			//	Show errors everywhere else
 			error_reporting( E_ALL|E_STRICT );
			define( 'DB_DEBUG', TRUE );
 		
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
 
 	include './index.ci.php';