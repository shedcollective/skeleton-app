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

		//	Load Bootstrap, app styles and JS
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
		$this->asset->load( 'app.min.js' );
	}
}

/* End of file NAILS_Controller.php */
/* Location: ./application/core/NAILS_Controller.php */