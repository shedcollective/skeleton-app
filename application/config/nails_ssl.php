<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$config['ssl_routes'] = array(

	//	All of admin secure please
	'admin',
	'admin/:any',
	
	//	All of auth secure
	'auth',
	'auth/:any',
	
	//	Contact forms secure
	'contact',
	'contact/:any',
	'employers/enquire',
	'employers/enquire/:any',
	
	//	Account areas secure
	'intern/account',
	'intern/account/:any',
	'employer/account',
	'employer/account/:any',
	
	//	Wizard
	'wizard',
	'wizard/:any'
	
	//	Anything else, on the fly...

);