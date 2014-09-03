#!/usr/bin/env php
<?php

/**
 * ---------------------------------------------------------------
 * NAILS DATABASE MIGRATION TOOL
 * ---------------------------------------------------------------
 *
 * This is the console application for migrating Nails module databases.
 *
 * Lead Developer: Pablo de la Peña	(p@shedcollective.org, @hellopablo)
 * Lead Developer: Gary Duncan		(g@shedcollective.org, @gsdd)
 *
 * Documentation: http://nailsapp.co.uk
 */

//	CLI only please
if (php_sapi_name() != "cli") {
	echo "This tool can only be used on the command line.";
	exit(1);
}

//	Set to run indefinitely if needed
set_time_limit(0);

//	Optional. It’s better to do it in the php.ini file
date_default_timezone_set('UTC');

//	Include the composer autoloader
require_once dirname(__FILE__) . '/vendor/autoload.php';

//	Import the Symfony Console Application
use Symfony\Component\Console\Application;

//	Include the migration tool
require_once dirname(__FILE__) . '/vendor/nailsapp/common/console/migration/migration.php';

$app = new Application();
$app->add(new Nails\Console\Installer\CORE_NAILS_MigrationTool());
$app->run();

/* End of file nails-install.php */
/* Location: ./nails-install.php */