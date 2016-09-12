<?php

use Nails\Factory;
use Nails\Common\Controller\Base;

class NAILS_Controller extends Base
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

        $oAsset = Factory::service('Asset');

        //  Load CSS from the app's `assets/build/css` directory
        $oAsset->load('app.css');

        //  Load JS from the app's `assets/build/js` directory
        $oAsset->load('app.min.js');
    }
}
