<?php
require_once(APPPATH . '/controllers/test/Toast.php');

class User_intern_tests extends Toast
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
	function _pre() {}
	
	
	// --------------------------------------------------------------------------
	
	
	/**
	 * OPTIONAL; Anything in this function will be run after each test
	 * I use it for setting $this->message = $this->My_model->getError();
	 */
	function _post() {}
	
	
	// --------------------------------------------------------------------------
	
	
	/**
	 * Blank test description goes here
	 */
	public function test_test()
	{
		$this->_assert_true( TRUE );
	}
	
}

/* End of file user_intern_tests.php */
/* Location: ./application/controllers/test/user_intern_tests.php */