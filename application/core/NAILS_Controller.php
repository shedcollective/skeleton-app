<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Nails. From the Shed
 * 
 * @package		Nails
 * @author		Pablo
 */

/* load the class from the package */
require NAILS_PATH . 'core/CORE_NAILS_Controller.php';

class NAILS_Controller extends CORE_NAILS_Controller
{
	public function __construct()
	{
		parent::__construct();
		
		// --------------------------------------------------------------------------
		
		//	Load NAILS. Assets; this little nugget of CSS will pull in skeleton and
		//	some common utility styles, such as Super Awesome Buttons.
		
		if ( ! $this->_module_is_enabled( 'admin' ) || $this->uri->segment( 1 ) != 'admin' ) :
		
			$this->asset->load( 'nails.default.css', TRUE );
			$this->asset->load( 'nails.default.min.js', TRUE );
			
		endif;
	}
}

/* End of file NAILS_Controller.php */
/* Location: ./public_html/application/core/NAILS_Controller.php */