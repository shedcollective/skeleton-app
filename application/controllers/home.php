<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends NAILS_Controller
{
	public function index()
	{
		if ( $this->user->is_logged_in() ) :

			$this->data['notice'] = '<strong>Oh, hey, ' . active_user( 'first_name' ) . '!</strong> Lovely to see you.';

		endif;

		// --------------------------------------------------------------------------

		$this->load->view( 'structure/header',	$this->data );
		$this->load->view( 'home/index',		$this->data );
		$this->load->view( 'structure/footer',	$this->data );
	}
}

/* End of file home.php */
/* Location: ./application/controllers/home.php */