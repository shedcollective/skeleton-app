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
if (!file_exists(__DIR__ . '/vendor/autoload.php')) {
    ?>
    <style type="text/css">
        p {
            font-family: monospace;
            margin: 20px 10px;
        }

        strong {
            color: red;
        }

        code {
            padding: 5px;
            border: 1px solid #CCC;
            background: #EEE
        }
    </style>
    <p>
        <strong>ERROR:</strong>
        Missing <code>vendor/autoload.php</code>; please run <code>nails install</code>
    </p>
    <?php
    exit;
}
require_once __DIR__ . '/vendor/autoload.php';

/*
 *---------------------------------------------------------------
 * Nails Bootstrapper
 *---------------------------------------------------------------
 */
Nails\Bootstrap::run(__FILE__);

/*
 *---------------------------------------------------------------
 * CodeIgniter
 *---------------------------------------------------------------
 */
require_once BASEPATH . 'core/CodeIgniter.php';

/*
 *---------------------------------------------------------------
 * Nails Shutdown Handler
 *---------------------------------------------------------------
 */
Nails\Bootstrap::shutdown();
