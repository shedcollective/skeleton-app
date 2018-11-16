<?php

/**
 * ---------------------------------------------------------------
 * NAILS MAIN APPLICATION
 * ---------------------------------------------------------------
 *
 * This is the kick off point for the main Nails Application.
 * Documentation: https://nailsapp.co.uk
 */

require_once __DIR__ . '/vendor/autoload.php';
Nails\Bootstrap::run(__FILE__);
require_once BASEPATH . 'core/CodeIgniter.php';
