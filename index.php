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

    function _NAILS_ERROR($error, $subject = '')
    {
        echo '<style type="text/css">';
            echo 'p {font-family:monospace;margin:20px 10px;}';
            echo 'strong { color:red;}';
            echo 'code { padding:5px;border:1px solid #CCC;background:#EEE }';
        echo '</style>';
        echo '<p>';
            echo '<strong>ERROR:</strong> ';
            echo $subject ? '<em>' . $subject . '</em> - ' : '';
            echo $error;
        echo '</p>';
        exit(0);
    }
}

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

    define('NAILS_PATH', realpath(dirname(__FILE__) . '/vendor/nailsapp/') . '/');
}

if (!defined('NAILS_COMMON_PATH')) {

    define('NAILS_COMMON_PATH', realpath(dirname(__FILE__) . '/vendor/nailsapp/common/') . '/');
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

$NAILS_CONTROLLER_DATA = array();


/*
 *---------------------------------------------------------------
 * TEST NAILS AVAILABILITY
 *---------------------------------------------------------------
 */

if (!file_exists(NAILS_COMMON_PATH . 'core/CORE_NAILS_Controller.php')) {

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

if (!file_exists(NAILS_COMMON_PATH . 'core/CORE_NAILS_Common.php')) {

    /**
     * Use the Nails startup error template, as we've established
     * Nails is available
     */

    $_ERROR = 'Could not find <code>CORE_NAILS_Common.php</code>, ensure that your Nails set up is correct.';
    include NAILS_COMMON_PATH . 'errors/startup_error.php';
}

require_once NAILS_COMMON_PATH . 'core/CORE_NAILS_Common.php';

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
 * SYSTEM FOLDER NAME
 *---------------------------------------------------------------
 *
 * This variable must contain the name of your "system" folder.
 * Include the path if the folder is not in the same  directory
 * as this file.
 *
 */
    $system_path = 'vendor/rogeriopradoj/codeigniter/system';

/*
 *---------------------------------------------------------------
 * APPLICATION FOLDER NAME
 *---------------------------------------------------------------
 *
 * If you want this front controller to use a different "application"
 * folder then the default one you can set its name here. The folder
 * can also be renamed or relocated anywhere on your server.  If
 * you do, use a full server path. For more info please see the user guide:
 * http://codeigniter.com/user_guide/general/managing_apps.html
 *
 * NO TRAILING SLASH!
 *
 */
    $application_folder = 'application';

/*
 * --------------------------------------------------------------------
 * DEFAULT CONTROLLER
 * --------------------------------------------------------------------
 *
 * Normally you will set your default controller in the routes.php file.
 * You can, however, force a custom routing by hard-coding a
 * specific controller class/function here.  For most applications, you
 * WILL NOT set your routing here, but it's an option for those
 * special instances where you might want to override the standard
 * routing in a specific front controller that shares a common CI installation.
 *
 * IMPORTANT:  If you set the routing here, NO OTHER controller will be
 * callable. In essence, this preference limits your application to ONE
 * specific controller.  Leave the function name blank if you need
 * to call functions dynamically via the URI.
 *
 * Un-comment the $routing array below to use this feature
 *
 */
    // The directory name, relative to the "controllers" folder.  Leave blank
    // if your controller is not in a sub-folder within the "controllers" folder
    // $routing['directory'] = '';

    // The controller class file name.  Example:  Mycontroller
    // $routing['controller'] = '';

    // The controller function you wish to be called.
    // $routing['function'] = '';


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
 *
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
    if (defined('STDIN'))
    {
        chdir(dirname(__FILE__));
    }

    if (realpath($system_path) !== FALSE)
    {
        $system_path = realpath($system_path).'/';
    }

    // ensure there's a trailing slash
    $system_path = rtrim($system_path, '/').'/';

    // Is the system path correct?
    if ( ! is_dir($system_path))
    {
        exit("Your system folder path does not appear to be set correctly. Please open the following file and correct this: ".pathinfo(__FILE__, PATHINFO_BASENAME));
    }

/*
 * -------------------------------------------------------------------
 *  Now that we know the path, set the main path constants
 * -------------------------------------------------------------------
 */
    // The name of THIS file
    define('SELF', pathinfo(__FILE__, PATHINFO_BASENAME));

    // The PHP file extension
    // this global constant is deprecated.
    define('EXT', '.php');

    // Path to the system folder
    define('BASEPATH', str_replace("\\", "/", $system_path));

    // Path to the front controller (this file)
    define('FCPATH', str_replace(SELF, '', __FILE__));

    // Name of the "system folder"
    define('SYSDIR', trim(strrchr(trim(BASEPATH, '/'), '/'), '/'));


    // The path to the "application" folder
    if (is_dir($application_folder))
    {
        define('APPPATH', $application_folder.'/');
    }
    else
    {
        if ( ! is_dir(BASEPATH.$application_folder.'/'))
        {
            exit("Your application folder path does not appear to be set correctly. Please open the following file and correct this: ".SELF);
        }

        define('APPPATH', BASEPATH.$application_folder.'/');
    }

/*
 * --------------------------------------------------------------------
 * LOAD THE BOOTSTRAP FILE
 * --------------------------------------------------------------------
 *
 * And away we go...
 *
 */
require_once BASEPATH.'core/CodeIgniter.php';

/* End of file index.php */
/* Location: ./index.php */