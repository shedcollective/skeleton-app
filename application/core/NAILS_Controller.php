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

		//	Load app styles and JS
		$this->asset->load( 'styles.css' );
		$this->asset->load( 'app.min.js' );
	}
}

/* End of file NAILS_Controller.php */
/* Location: ./application/core/NAILS_Controller.php */