<?php

/**
 * ---------------------------------------------------------------
 * NAILS MAIN APPLICATION
 * ---------------------------------------------------------------
 *
 * This is the kick off point for the main Nails Application.
 * Documentation: https://nailsapp.co.uk
 */

/*
 *---------------------------------------------------------------
 * Autoloader
 *---------------------------------------------------------------
 */
$sEntryPoint = realpath(__DIR__ . '/..') . '/index.php';
require_once dirname($sEntryPoint) . '/vendor/autoload.php';

/*
 *---------------------------------------------------------------
 * Nails Bootstrapper
 *---------------------------------------------------------------
 */
\Nails\Bootstrap::run($sEntryPoint);
