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

 	if ( ! file_exists( dirname(__FILE__) . '/settings/app.php' ) ) :

 		if ( isset( $_SERVER['SCRIPT_NAME'] ) ) :

 			$_location  = dirname( $_SERVER['SCRIPT_NAME'] );
 			$_location .= substr( $_location, -1 ) != '/' ? '/' : '';

	 		header( 'Location: ' . $_location . 'nails-install.php' );
		 	exit( 0 );

 		else :

			echo '<style type="text/css">';
			echo 'p {font-family:monospace;margin:20px 10px;}';
			echo 'strong { color:red;}';
			echo 'code { padding:5px;border:1px solid #CCC;background:#EEE }';
			echo '</style>';
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

			echo '<style type="text/css">';
			echo 'p {font-family:monospace;margin:20px 10px;}';
			echo 'strong { color:red;}';
			echo 'code { padding:5px;border:1px solid #CCC;background:#EEE }';
			echo '</style>';
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

	if ( ! defined( 'NAILS_PATH' ) ) :

		define( 'NAILS_PATH', realpath( dirname( __FILE__ ) . '/vendor/shed/nails/' ) . '/' );

	endif;


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

		echo '<style type="text/css">';
		echo 'p {font-family:monospace;margin:20px 10px;}';
		echo 'strong { color:red;}';
		echo 'code { padding:5px;border:1px solid #CCC;background:#EEE }';
		echo '</style>';
		echo '<p><strong>ERROR:</strong> Cannot find a valid Nails installation, have you run <code>composer update</code>?.</p>';
		exit( 0 );

	endif;


 /*
 | --------------------------------------------------------------------
 | LOAD NAILS COMMON FUNCTIONS
 | --------------------------------------------------------------------
 |
 | Loads functions defined by Nails which may be required prior to the
 | Nails Bootstrap initiating.
 |
 |
 */
 	if ( ! file_exists( NAILS_PATH . 'core/CORE_NAILS_Common.php' ) ) :

 		//	Use the NAils startup error template, as we've established
 		//	Nails is available

		$_ERROR = 'Could not find <code>CORE_NAILS_Common.php</code>, ensure that your NAils set up is correct.';
		include NAILS_PATH . 'errors/startup_error.php';

	endif;

	require_once NAILS_PATH . 'core/CORE_NAILS_Common.php';

 /*
 | --------------------------------------------------------------------
 | CODEIGNITER
 | --------------------------------------------------------------------
 |
 | Load up the Main CodeIgniter index file
 |
 */

 	require dirname(__FILE__) . '/index.ci.php';