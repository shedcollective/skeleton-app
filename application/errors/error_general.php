<?php

	//	Load the Nails. error template, override this if you so desire
	if ( file_exists( NAILS_PATH . 'errors/error_general.php' ) ) :
	
		require NAILS_PATH . 'errors/error_general.php';
	
	else :
	
		?>
			<!DOCTYPE html>
			<html lang="en">
			<head>
			<title>Error</title>
			</head>
			<body>
				<div id="container">
					<h1><?php echo $heading; ?></h1>
					<?php echo $message; ?>
				</div>
			</body>
			</html>
		<?
	
	endif;