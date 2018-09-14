<?php

/**
 * ---------------------------------------------------------------
 * NAILS MAIN APPLICATION
 * ---------------------------------------------------------------
 *
 * This is the kick off point for the main Nails Application.
 *
 * Lead Developer: Pablo de la Peña (p@nailsapp.co.uk, @hellopablo)
 * Lead Developer: Gary Duncan      (g@nailsapp.co.uk, @gsdd)
 *
 * Documentation: http://docs.nailsapp.co.uk
 */

if (!function_exists('_NAILS_ERROR')) {
    function _NAILS_ERROR($sError, $sSubject = '')
    {
        echo '<style type="text/css">';
        echo 'p {font-family:monospace;margin:20px 10px;}';
        echo 'strong { color:red;}';
        echo 'code { padding:5px;border:1px solid #CCC;background:#EEE }';
        echo '</style>';
        echo '<p>';
        echo '<strong>ERROR:</strong> ';
        echo $sSubject ? '<em>' . $sSubject . '</em> - ' : '';
        echo $sError;
        echo '</p>';
        exit(0);
    }
}

/*
 *---------------------------------------------------------------
 * Autoloading
 *---------------------------------------------------------------
 *
 * Load Composer's autoloader
 *
 */

if (!file_exists(dirname(__FILE__) . '/vendor/autoload.php')) {
    _NAILS_ERROR('Missing vendor/autoload.php; please run composer install.');
}

require_once dirname(__FILE__) . '/vendor/autoload.php';

/*
 *---------------------------------------------------------------
 * APP SETTINGS
 *---------------------------------------------------------------
 *
 * Load app specific settings.
 *
 */

if (!file_exists(dirname(__FILE__) . '/config/app.php')) {
    _NAILS_ERROR('Missing config/app.php; please run installer.');
}

require dirname(__FILE__) . '/config/app.php';

/*
 *---------------------------------------------------------------
 * DEPLOY SETTINGS
 *---------------------------------------------------------------
 *
 * Load environment specific settings.
 *
 */

if (!file_exists(dirname(__FILE__) . '/config/deploy.php')) {
    _NAILS_ERROR('Missing config/deploy.php; please run installer.');
}

require dirname(__FILE__) . '/config/deploy.php';

/*
 *---------------------------------------------------------------
 * GLOBAL CONSTANTS
 *---------------------------------------------------------------
 *
 * These global constants need defined early on, they can be
 * overridden by app.php or deploy.php
 *
 */

if (!defined('NAILS_PATH')) {
    define('NAILS_PATH', realpath(dirname(__FILE__) . '/vendor/nails/') . '/');
}

if (!defined('NAILS_COMMON_PATH')) {
    define('NAILS_COMMON_PATH', realpath(dirname(__FILE__) . '/vendor/nails/common/') . '/');
}

/*
 *---------------------------------------------------------------
 * NAILS CONTROLLER DATA
 *---------------------------------------------------------------
 *
 * This global variable will store all the information that
 * controllers set using $this->data. This allows us to reference
 * this variable outwith the scope of the controller, e.g in
 * models and libraries.
 *
 */

$NAILS_CONTROLLER_DATA = [];

/*
 *---------------------------------------------------------------
 * TEST NAILS AVAILABILITY
 *---------------------------------------------------------------
 */

if (!file_exists(NAILS_COMMON_PATH)) {
    _NAILS_ERROR('Cannot find a valid Nails installation, have you run <code>composer install</code>?');
}

/*
 *---------------------------------------------------------------
 * LOAD NAILS COMMON FUNCTIONS
 *---------------------------------------------------------------
 *
 * Loads functions defined by Nails which may be required prior to the
 * Nails Bootstrap initiating.
 *
 */
if (!file_exists(NAILS_COMMON_PATH . 'src/Common/CodeIgniter/Core/Common.php')) {
    _NAILS_ERROR(
        'Could not find <code>Nails\Common\CodeIgniter\Core\Common()</code>, ensure Nails is set up correctly.'
    );
}

require_once NAILS_COMMON_PATH . 'src/Common/CodeIgniter/Core/Common.php';

/*
 *---------------------------------------------------------------
 * CODEIGNITER
 *---------------------------------------------------------------
 *
 * Nails configurations complete, kick-start CodeIgniter. Everything
 * below this line is vanilla CodeIgniter.
 *
 */

/*
 *---------------------------------------------------------------
 * SYSTEM DIRECTORY NAME
 *---------------------------------------------------------------
 *
 * This variable must contain the name of your "system" directory.
 * Set the path if it is not in the same directory as this file.
 */
$system_path = 'vendor/codeigniter/framework/system';

/*
 *---------------------------------------------------------------
 * APPLICATION DIRECTORY NAME
 *---------------------------------------------------------------
 *
 * If you want this front controller to use a different "application"
 * directory than the default one you can set its name here. The directory
 * can also be renamed or relocated anywhere on your server. If you do,
 * use an absolute (full) server path.
 * For more info please see the user guide:
 *
 * https://codeigniter.com/user_guide/general/managing_apps.html
 *
 * NO TRAILING SLASH!
 */
$application_folder = 'application';

/*
 *---------------------------------------------------------------
 * VIEW DIRECTORY NAME
 *---------------------------------------------------------------
 *
 * If you want to move the view directory out of the application
 * directory, set the path to it here. The directory can be renamed
 * and relocated anywhere on your server. If blank, it will default
 * to the standard location inside your application directory.
 * If you do move this, use an absolute (full) server path.
 *
 * NO TRAILING SLASH!
 */
$view_folder = '';

/*
 * --------------------------------------------------------------------
 * DEFAULT CONTROLLER
 * --------------------------------------------------------------------
 *
 * Normally you will set your default controller in the routes.php file.
 * You can, however, force a custom routing by hard-coding a
 * specific controller class/function here. For most applications, you
 * WILL NOT set your routing here, but it's an option for those
 * special instances where you might want to override the standard
 * routing in a specific front controller that shares a common CI installation.
 *
 * IMPORTANT: If you set the routing here, NO OTHER controller will be
 * callable. In essence, this preference limits your application to ONE
 * specific controller. Leave the function name blank if you need
 * to call functions dynamically via the URI.
 *
 * Un-comment the $routing array below to use this feature
 */
// The directory name, relative to the "controllers" directory.  Leave blank
// if your controller is not in a sub-directory within the "controllers" one
// $routing['directory'] = '';

// The controller class file name.  Example:  mycontroller
// $routing['controller'] = '';

// The controller function you wish to be called.
// $routing['function']	= '';

/*
 * -------------------------------------------------------------------
 *  CUSTOM CONFIG VALUES
 * -------------------------------------------------------------------
 *
 * The $assign_to_config array below will be passed dynamically to the
 * config class when initialized. This allows you to set custom config
 * items or override any default config values found in the config.php file.
 * This can be handy as it permits you to share one application between
 * multiple front controller files, with each file containing different
 * config values.
 *
 * Un-comment the $assign_to_config array below to use this feature
 */
// $assign_to_config['name_of_config_item'] = 'value of config item';

// --------------------------------------------------------------------
// END OF USER CONFIGURABLE SETTINGS.  DO NOT EDIT BELOW THIS LINE
// --------------------------------------------------------------------

/*
 * ---------------------------------------------------------------
 *  Resolve the system path for increased reliability
 * ---------------------------------------------------------------
 */

// Set the current directory correctly for CLI requests
if (defined('STDIN')) {
    chdir(dirname(__FILE__));
}

if (($_temp = realpath($system_path)) !== false) {
    $system_path = $_temp . DIRECTORY_SEPARATOR;
} else {
    // Ensure there's a trailing slash
    $system_path = strtr(
            rtrim($system_path, '/\\'),
            '/\\',
            DIRECTORY_SEPARATOR . DIRECTORY_SEPARATOR
        ) . DIRECTORY_SEPARATOR;
}

// Is the system path correct?
if (!is_dir($system_path)) {
    header('HTTP/1.1 503 Service Unavailable.', true, 503);
    echo 'Your system folder path does not appear to be set correctly. Please open the following file and correct this: ' . pathinfo(__FILE__, PATHINFO_BASENAME);
    exit(3); // EXIT_CONFIG
}

/*
 * -------------------------------------------------------------------
 *  Now that we know the path, set the main path constants
 * -------------------------------------------------------------------
 */
// The name of THIS file
define('SELF', pathinfo(__FILE__, PATHINFO_BASENAME));

// Path to the system directory
define('BASEPATH', $system_path);

// Path to the front controller (this file) directory
define('FCPATH', dirname(__FILE__) . DIRECTORY_SEPARATOR);

// Name of the "system" directory
define('SYSDIR', basename(BASEPATH));

// The path to the "application" directory
if (is_dir($application_folder)) {
    if (($_temp = realpath($application_folder)) !== false) {
        $application_folder = $_temp;
    } else {
        $application_folder = strtr(
            rtrim($application_folder, '/\\'),
            '/\\',
            DIRECTORY_SEPARATOR . DIRECTORY_SEPARATOR
        );
    }
} elseif (is_dir(BASEPATH . $application_folder . DIRECTORY_SEPARATOR)) {
    $application_folder = BASEPATH . strtr(
            trim($application_folder, '/\\'),
            '/\\',
            DIRECTORY_SEPARATOR . DIRECTORY_SEPARATOR
        );
} else {
    header('HTTP/1.1 503 Service Unavailable.', true, 503);
    echo 'Your application folder path does not appear to be set correctly. Please open the following file and correct this: ' . SELF;
    exit(3); // EXIT_CONFIG
}

define('APPPATH', $application_folder . DIRECTORY_SEPARATOR);

// The path to the "views" directory
if (!isset($view_folder[0]) && is_dir(APPPATH . 'views' . DIRECTORY_SEPARATOR)) {
    $view_folder = APPPATH . 'views';
} elseif (is_dir($view_folder)) {
    if (($_temp = realpath($view_folder)) !== false) {
        $view_folder = $_temp;
    } else {
        $view_folder = strtr(
            rtrim($view_folder, '/\\'),
            '/\\',
            DIRECTORY_SEPARATOR . DIRECTORY_SEPARATOR
        );
    }
} elseif (is_dir(APPPATH . $view_folder . DIRECTORY_SEPARATOR)) {
    $view_folder = APPPATH . strtr(
            trim($view_folder, '/\\'),
            '/\\',
            DIRECTORY_SEPARATOR . DIRECTORY_SEPARATOR
        );
} else {
    header('HTTP/1.1 503 Service Unavailable.', true, 503);
    echo 'Your view folder path does not appear to be set correctly. Please open the following file and correct this: ' . SELF;
    exit(3); // EXIT_CONFIG
}

define('VIEWPATH', $view_folder . DIRECTORY_SEPARATOR);

/*
 * --------------------------------------------------------------------
 * LOAD THE BOOTSTRAP FILE
 * --------------------------------------------------------------------
 *
 * And away we go...
 */
require_once BASEPATH . 'core/CodeIgniter.php';
