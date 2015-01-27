<?php

/* load the class from the package */
require_once NAILS_COMMON_PATH . 'core/CORE_NAILS_Controller.php';

class NAILS_Controller extends CORE_NAILS_Controller
{
    /**
     * Construct the controller
     * Code that is defined in here is executed before the controller which
     * is being called by the URL. It is common to load site-wide assets in
     * here, or to define site-wide variables.
     */
    public function __construct()
    {
        /**
         * It is important to call the parent constructor in order to ensure
         * expected functionality is inherited properly.
         */

        parent::__construct();

        //  Load CSS from the App's `assets/bower_components` directory
        $this->asset->load('bootstrap/dist/css/bootstrap.min.css', 'BOWER');

        //  Load CSS from the App's `assets/css` directory
        $this->asset->load('styles.css');

        //  Load JS from the App's `assets/bower_components` directory
        $this->asset->load('jquery/dist/jquery.min.js', 'BOWER');
        $this->asset->load('bootstrap/dist/js/bootstrap.min.js', 'BOWER');

        //  Load JS from the App's `assets/js` directory
        $this->asset->load('app.min.js');
    }
}
