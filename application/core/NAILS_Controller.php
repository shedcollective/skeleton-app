<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Nails. From the Shed
 *
 * @package		Nails
 * @author		Pablo
 */

/* load the class from the package */
require_once NAILS_COMMON_PATH . 'core/CORE_NAILS_Controller.php';

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

		$this->asset->load( 'fancybox/source/jquery.fancybox.css', 'BOWER' );
		$this->asset->load( 'ionicons/css/ionicons.min.css', 'BOWER' );
		$this->asset->load( 'styles.css' );

		//	Load JS
		$this->asset->load( 'jquery/dist/jquery.min.js', 'BOWER' );
		$this->asset->load( 'bootstrap/dist/js/bootstrap.min.js', 'BOWER' );
		$this->asset->load( 'fancybox/source/jquery.fancybox.pack.js', 'BOWER' );
		$this->asset->load( 'app.min.js' );

		//	Bind to Fancybox links
		$this->asset->inline( '<script>$( \'a.fancybox\' ).fancybox();</script>' );
	}
}

/* End of file NAILS_Controller.php */
/* Location: ./application/core/NAILS_Controller.php */