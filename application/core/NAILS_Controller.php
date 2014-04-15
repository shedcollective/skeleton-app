<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Nails. From the Shed
 *
 * @package		Nails
 * @author		Pablo
 */

/* load the class from the package */
require_once NAILS_PATH . 'core/CORE_NAILS_Controller.php';

class NAILS_Controller extends CORE_NAILS_Controller
{
	public function __construct()
	{
		parent::__construct();

		// --------------------------------------------------------------------------

		//	Load some default CSS and JS, amend this as required for your website.

		//	Load CSS
		switch( (int) APP_BOOTSTRAP_GRID ) :

			case 24 :

				$this->asset->load( 'bootstrap.24.css', TRUE );

			break;

			case 12:
			default:

				$this->asset->load( 'bootstrap.12.css', TRUE );

			break;

		endswitch;

		$this->asset->load( 'styles.css' );
		$this->asset->load( 'jquery.fancybox.css', TRUE );

		//	Load JS
		$this->asset->load( 'jquery.min.js', TRUE );
		$this->asset->load( 'bootstrap.min.js', TRUE );
		$this->asset->load( 'jquery.fancybox.min.js', TRUE );
		$this->asset->load( 'app.min.js' );

		//	Bind to Fancybox links
		$this->asset->inline( '<script>$( \'a.fancybox\' ).fancybox();</script>' );
	}
}

/* End of file NAILS_Controller.php */
/* Location: ./application/core/NAILS_Controller.php */