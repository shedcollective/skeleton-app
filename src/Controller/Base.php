<?php

namespace App\Controller;

use Nails\Common\Exception\FactoryException;
use Nails\Common\Exception\NailsException;
use Nails\Common\Service\Asset;
use Nails\Factory;

/**
 * Class Base
 *
 * @package App\Controller
 */
abstract class Base extends \Nails\Common\Controller\Base
{
    /**
     * Construct the controller
     * Code that is defined in here is executed before the controller which
     * is being called by the URL. It is common to load site-wide assets in
     * here, or to define site-wide variables.
     *
     * @throws FactoryException
     * @throws NailsException
     */
    public function __construct()
    {
        /**
         * It is important to call the parent constructor in order to ensure
         * expected functionality is inherited properly.
         */
        parent::__construct();

        $this
            ->loadAssets();
    }

    // --------------------------------------------------------------------------

    /**
     * Load global assets
     *
     * @return $this
     * @throws FactoryException
     */
    protected function loadAssets(): self
    {
        /** @var Asset $oAsset * */
        $oAsset = Factory::service('Asset');
        $oAsset
            //  Load CSS from the app's `assets/build/css` directory
            ->load('app.css')
            //  Load JS from the app's `assets/build/js` directory
            ->load('vendor.js')
            ->load('app.js')
            //  Load external fonts
            ->load('https://fonts.googleapis.com/css?family=Open+Sans', null, 'CSS');

        return $this;
    }
}
