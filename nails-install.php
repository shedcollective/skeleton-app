<?php

/*
 | --------------------------------------------------------------------
 | NAILS INSTALLER
 | --------------------------------------------------------------------
 |

 | or installing modules into an existing application.
 |
 | Lead Developer: Pablo de la Peña	(p@shedcollective.org, @hellopablo)
 | Lead Developer: Gary Duncan		(g@shedcollective.org, @gsdd)
 |
 | Documentation: http://docs.nailsapp.co.uk
 |
 */

//	Look for Core Nails installer
$_NAILS_INSTALLER = dirname(__FILE__) . '/vendor/shed/nails/installer/installer.php';

if ( ! is_file( $_NAILS_INSTALLER ) ) :

	echo '<style type="text/css">';
	echo 'p {font-family:monospace;margin:20px 10px;}';
	echo 'strong { color:red;}';
	echo 'code { padding:5px;border:1px solid #CCC;background:#EEE }';
	echo '</style>';
	echo '<p><strong>ERROR:</strong> Cannot find a valid Nails installation, have you run <code>composer install</code>?.</p>';
	exit( 0 );

endif;

require_once $_NAILS_INSTALLER;

// --------------------------------------------------------------------------

class NAILS_Installer extends CORE_NAILS_Installer
{
	public function __construct()
	{
		$this->_abpath = dirname(__FILE__);
		parent::__construct();
	}
}

$INSTALLER = new NAILS_Installer();
$INSTALLER->start();