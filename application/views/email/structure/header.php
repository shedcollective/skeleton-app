<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title><?=$email_subject?></title>
		<style type="text/css">
		
			body,
			html
			{
				margin:0;
				padding:0;
				height:100%;
				background-color:#ddd;
				background:url(<?=site_url( 'assets/email/templates/2012-02/bg.png' )?>);
			}
			
			a:link,
			a:visited,
			a:active
			{
				color:#2185bc;
				text-decoration:none;
				border-bottom:1px dotted;
			}
			
			#body-imposter
			{
				text-align:center;
				font-family:helvetica,arial,sans-serif;
				background:url(bg.png);
			}
			
			.header
			{
				color:#999;
			}
			
			.footer
			{
				color:#999;
				border-top:1px dotted #ccc;
				padding-top:20px;
			}
			
			.padding
			{
				padding:30px;
			}
			
			table
			{
				display:block;
				text-align:left;
				margin:auto;
			}
			
			th,td
			{
				font-size:14px;
				line-height:26px;
				color:#1f1f1f;
			}
			
			th
			{
				font-size:1.4em;
				font-weight:normal;
			}
			
			p
			{
				margin-bottom:1em;
			}
			
			.small
			{
				font-size:0.8em;
				line-height:22px;
			}
			.small a
			{
				color:inherit;
				text-decoration:none;
				border-bottom:1px dotted #ccc;
			}
			
			.title
			{
				font-size:1.4em;
				line-height:35px;
				font-style:italic;
				font-family:georgia,serif;
				color:#2185bc;
			}
			
			blockquote
			{
				margin-left:0;
				margin-right:0;
				padding:10px 10px 10px 10px;
				border-left:4px solid #efefef;
				border-right:1px solid #efefef;
				background:#f6f6f6;
			}
		
		</style>
	</head>
	<body>
	
		<div id="body-imposter">
		
			<table width="650" border="0" align="center" cellpadding="0" cellspacing="0">
			
				<thead>

					<tr>
						<th>
							<table class="padding" style="background:#fafafa;border-top:1px solid #aaa;margin-top:30px;border-bottom:1px dashed #e0e0e0;" width="590" align="center" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td valign="middle" width="440" class="title">
										<?=$email_subject?>
									</td>
									<td width="150" style="text-align:right;font-weight:bold;letter-spacing:-1px;color:#aaa;">
										<span style="color:#333;">Intern</span><span style="color:#3aa2f3">Avenue</span>
									</td>
								</tr>
							</table>
						</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>
							<table class="padding" style="border-bottom:1px solid #aaa;" bgcolor="#fff" width="590" align="center" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="2" width="590">