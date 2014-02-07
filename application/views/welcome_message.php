<!DOCTYPE html>
<html>
	<head>
		<title>Nails.</title>
		<meta charset="utf-8">

		<!--	STYLES	-->
		<link href="<?=NAILS_ASSETS_URL?>css/nails.default.css" rel="stylesheet">

		<style type="text/css">

			#main-col
			{
				text-align:center;
				margin-top:100px;
			}

			#label
			{
				position:absolute;
				width:100px;
				height:105px;
				right:0px;
				top:0px;
				background:#F8f8F8;
				background-image:url(<?=NAILS_ASSETS_URL?>img/shed-badge/75x75.png);
				background-repeat: no-repeat;
				background-position:center 18px;
				-webkit-box-shadow: 1px 1px 5px #ccc;
				-moz-box-shadow: 1px 1px 5px #ccc;
				box-shadow: 1px 1px 5px #ccc;

				-webkit-border-bottom-left-radius: 4px;
				-webkit-border-bottom-right-radius: 4px;
				-moz-border-bottom-left-radius: 4px;
				-moz-border-bottom-right-radius: 4px;
				border-bottom-left-radius: 4px;
				border-bottom-right-radius: 4px;
			}

			#label:active
			{
				height:115px;
				background-position:center 28px;
			}

		</style>

	</head>
	<body>
		<div class="container row">
			<a href="http://shedcollective.org" id="label"></a>
			<div class="six columns first last offset-by-five" id="main-col">
				<h1><?=APP_NAME?></h1>
				<hr />
				<p>Your <strong>Nails.</strong> application has been correctly installed and is ready for you to get stuck in!</p>
				<p>Lost? Check out <?=anchor( 'http://docs.nailsapp.co.uk', 'the documentation' )?>.</p>
				<p><small>Happy codin'</small></p>
			</div>
		</div>
	</body>
</html>