<?php
require_once(APPPATH . '/controllers/test/Toast.php');

class Faq_tests extends Toast
{
	function __construct()
	{
		parent::__construct(__FILE__);
		// Load any models, libraries etc. you need here
	}
	
	// --------------------------------------------------------------------------
	
	/**
	 * OPTIONAL; Anything in this function will be run before each test
	 * Good for doing cleanup: resetting sessions, renewing objects, etc.
	 */
	function _pre() {
	
		$this->load->model( 'faq_model' );
	
	}
	
	// --------------------------------------------------------------------------

	/**
	 * OPTIONAL; Anything in this function will be run after each test
	 * I use it for setting $this->message = $this->My_model->getError();
	 */
	function _post() {}
	
	// --------------------------------------------------------------------------
	
	
	/**
	 * Tests the get_all() method; should return an array of FAQ items which fit
	 * a defined structure.
	 */
	public function test_get_all()
	{
		$faq = $this->faq_model->get_all();
		
		if ( $this->_assert_not_empty( $faq ) ) :
		
			//	FAQs found, check struture
			extract( (array) $faq[0] );
			
			$this->_assert_true( $id );
			$this->_assert_true( $slug );
			$this->_assert_true( $label );
			$this->_assert_true( $body );
			//$this->_assert_true( $order );
		
		else :
		
			$this->_fail( 'No FAQs were returned.' );
		
		endif;
	}
	
}

/* End of file faq.php */
/* Location: ./application/controllers/test/faq.php */