<?php

class Fatal_Error_Hook
{

	/**
	 * @return void
	 */
	public function register()
	{
		register_shutdown_function( array( &$this, 'handleShutdown' ) );
	}
	
	
	// --------------------------------------------------------------------------
	
	
	/**
	 * @return void
	 */
	public function handleShutdown()
	{
		if ( ENVIRONMENT != 'production' ) :
		
			return FALSE;
		
		endif;
		
		// --------------------------------------------------------------------------
		
		$aError = error_get_last();
		
		if ( ! is_null( $aError ) ) :
		
			$this->saveAndEmailFatal( $aError );
		
		endif;
	}
	
	
	// --------------------------------------------------------------------------
	
	
	/**
	 * This method will gather together most variables, the callstack and the actual triggering error
	 * and then email the whole lot.
	 *
	 * @param unknown_type $insSeverity
	 * @param unknown_type $insMessage
	 * @param unknown_type $insFilePath
	 * @param unknown_type $insLine
	 */
	public function saveAndEmailError( $insSeverity, $insMessage, $insFilePath, $insLine, $infFull = true )
	{
		$oCI =& get_instance();
		
		$aInfo = array(
			'type'			=> $infFull? 'Triggered' : 'HandleShutdown',
			'severity'		=> $this->getSeverityText( $insSeverity ),
			'message'		=> $insMessage,
			'filepath'		=> $insFilePath,
			'line'			=> $insLine,
			'session'		=> json_encode( $oCI->session->userdata ),
			'post'			=> json_encode( $_POST ),
			'get'			=> json_encode( $_GET ),
			'server'		=> json_encode( $_SERVER ),
			'globals'		=> isset( $GLOBALS['error'] )? json_encode( $GLOBALS['error'] ): '',
			'uri'			=> $oCI->uri->uri_string()
		);
		
		//	Prep the email and send
		$_to		= APP_EMAIL_DEVELOPER;
		$_subject	= 'FATAL ERROR OCCURRED ON ' . strtoupper( APP_NAME );
		$_message	= 'Hi,' . "\n";
		$_message	.= '' . "\n";
		$_message	.= 'A Fatal Error just occurred within ' . APP_NAME . ' (' . $_SERVER['HTTP_HOST'] . ')' . "\n";
		$_message	.= '' . "\n";
		$_message	.= 'Please take a look as a matter of urgency; details are noted below:' . "\n";
		$_message	.= '' . "\n";
		$_message	.= '- - - - - - - - - - - - - - - - - - - - - -' . "\n";
		$_message	.= '' . "\n";
		
		$_message	.= 'Type: ' . $aInfo['type'] . "\n";
		$_message	.= 'Severity: ' . $aInfo['severity'] . "\n";
		$_message	.= 'Message: ' . $aInfo['message'] . "\n";
		$_message	.= 'File Path: ' . $aInfo['filepath'] . "\n";
		$_message	.= 'Line: ' . $aInfo['line'] . "\n\n";
		$_message	.= 'SESSION: ' . $aInfo['session'] . "\n\n";
		$_message	.= 'POST: ' . $aInfo['post'] . "\n\n";
		$_message	.= 'GET: ' . $aInfo['get'] . "\n\n";
		$_message	.= 'SERVER: ' . $aInfo['server'] . "\n\n";
		$_message	.= 'GLOBALS: ' . $aInfo['globals'] . "\n\n";
		$_message	.= 'URI: ' . $aInfo['uri'] . "\n";
		$_message	.= '' . "\n";
		
		$_headers = 'From: ' . APP_EMAIL_FROM_NAME . ' <' . 'root@' . gethostname() . '>' . "\r\n" .
					'Reply-To: ' . APP_EMAIL_FROM_EMAIL . "\r\n" .
					'X-Mailer: PHP/' . phpversion()  . "\r\n" .
					'X-Priority: 1 (Highest)' . "\r\n" .
					'X-Mailer: X-MSMail-Priority: High/' . "\r\n" .
					'Importance: High';
		
		@mail( $_to, $_subject , $_message, $_headers );
		
		// --------------------------------------------------------------------------
		
		//	Log the error
		$_message = $aInfo['severity'] . ': ' . $aInfo['message'] . ' in ' . $aInfo['filepath'] . ' on line ' . $aInfo['line'];
		log_message( 'error', $_message );
		
		// --------------------------------------------------------------------------
		
		//	Show some thign to the user
		?>
		<!DOCTYPE html>
		<html>
			<head>
				<title>Error</title>
				<meta charset="utf-8">
				<style type="text/css">
				
					body {
					   font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; 
					   font-weight: 300;
					   text-align: center;
					   font-size:14px;
					   color:#444;
					   margin:100px;
					}
					
					h1
					{
						margin:auto;
						width:400px;
						margin-bottom:30px;
					}
					
					p
					{
						margin:auto;
						width:400px;
					}
					
					p small
					{
						font-size:10px;
						display:block;
						margin-top:40px;
					}
				
				</style>
			</head>
			<body>
				<h1>Sorry, an error occurred ☹</h1>
				<p>
					An error occurred which we couldn't recover from. The technical team have been informed, we apologise for the inconvenience.
				</p>
				<p>
					<small>Powered by <a href="http://nailsapp.co.uk">Nails</a></small>
				</p>
			</body>
		</html>
		<?php
	}
	
	
	// --------------------------------------------------------------------------
	
	
	public function saveAndEmailFatal( $inaError )
	{
		$this->saveAndEmailError( $inaError['type'], $inaError['message'], $inaError['file'], $inaError['line'], false );
	}
	
	
	// --------------------------------------------------------------------------
	
	
	private function getSeverityText( $innSeverity )
	{
		$aErrorType = array (
			E_ERROR				=> 'FATAL ERROR',
			E_WARNING			=> 'WARNING',
			E_PARSE				=> 'PARSING ERROR',
			E_NOTICE			=> 'NOTICE',
			E_CORE_ERROR		=> 'CORE ERROR',
			E_CORE_WARNING		=> 'CORE WARNING',
			E_COMPILE_ERROR		=> 'COMPILE ERROR',
			E_COMPILE_WARNING	=> 'COMPILE WARNING',
			E_USER_ERROR		=> 'USER ERROR',
			E_USER_WARNING		=> 'USER WARNING',
			E_USER_NOTICE		=> 'USER NOTICE',
			E_STRICT			=> 'STRICT NOTICE',
			E_RECOVERABLE_ERROR	=> 'RECOVERABLE ERROR'
		);
		return $aErrorType[$innSeverity];
	}
}

/* End of file fatal_error_hook.php */
/* Location: ./application/hooks/fatal_error_hook.php */