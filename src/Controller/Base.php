<?php

namespace App\Controller;

use Nails\Common\Service\Asset;
use Nails\Common\Service\Meta;
use Nails\Factory;

class Base extends \Nails\Common\Controller\Base
{
    /**
     * Construct the controller
     * Code that is defined in here is executed before the controller which
     * is being called by the URL. It is common to load site-wide assets in
     * here, or to define site-wide variables.
     *
     * @throws \Nails\Common\Exception\FactoryException
     */
    public function __construct()
    {
        /**
         * It is important to call the parent constructor in order to ensure
         * expected functionality is inherited properly.
         */
        parent::__construct();

        $this
            ->loadAssets()
            ->loadMeta();
    }

    // --------------------------------------------------------------------------

    /**
     * Load global assets
     *
     * @return $this
     * @throws \Nails\Common\Exception\FactoryException
     */
    protected function loadAssets(): self
    {
        /** @var Asset $oAsset * */
        $oAsset = Factory::service('Asset');
        $oAsset
            //  Load CSS from the app's `assets/build/css` directory
            ->load('app.css')
            //  Load JS from the app's `assets/build/js` directory
            ->load('app.js')
            //  Load external fonts
            ->load('https://fonts.googleapis.com/css?family=Open+Sans', 'JS');

        return $this;
    }

    // --------------------------------------------------------------------------

    /**
     * Load global meta tags
     *
     * @return $this
     * @throws \Nails\Common\Exception\FactoryException
     */
    private function loadMeta(): self
    {
        /** @var Meta $oMeta * */
        $oMeta = Factory::service('Meta');

        // Favicons
        $oMeta
            ->addRaw([
                'tag'  => 'link',
                'rel'  => 'icon',
                'href' => site_url('favicon.ico'),
            ])
            ->addRaw([
                'tag'   => 'link',
                'rel'   => 'icon',
                'type'  => 'image/png',
                'href'  => site_url('assets/img/favicons/favicon-16x16.png'),
                'sizes' => '16x16',
            ])
            ->addRaw([
                'tag'   => 'link',
                'rel'   => 'icon',
                'type'  => 'image/png',
                'href'  => site_url('assets/img/favicons/favicon-32x32.png'),
                'sizes' => '32x32',
            ])
            ->addRaw([
                'tag'   => 'link',
                'rel'   => 'apple-touch-icon',
                'sizes' => '180x180',
                'href'  => site_url('assets/img/favicons/apple-touch-icon.png'),
            ])
            ->addRaw([
                'tag'  => 'link',
                'rel'  => 'mask-icon',
                'type' => 'image/svg+xml',
                'href' => site_url('assets/img/favicons/safari-pinned-tab.svg'),
            ]);

        // --------------------------------------------------------------------------

        //  Other meta tags
        $oMeta
            ->add('apple-mobile-web-app-title', APP_NAME)
            ->add('application-name', APP_NAME)
            ->add('theme-color', '#ffffff”')
            ->add('description', '@todo.');

        // --------------------------------------------------------------------------

        // Open graph meta
        $oMeta
            ->addRaw([
                'tag'      => 'meta',
                'property' => 'og:title',
                'content'  => APP_NAME,
            ])
            ->addRaw([
                'tag'      => 'meta',
                'property' => 'og:type',
                'content'  => 'website',
            ])
            ->addRaw([
                'tag'      => 'meta',
                'property' => 'og:locale',
                'content'  => 'en_GB',
            ])
            ->addRaw([
                'tag'      => 'meta',
                'property' => 'og:image',
                'content'  => site_url('/assets/img/share/facebook.jpg'),
            ])
            ->addRaw([
                'tag'      => 'meta',
                'property' => 'og:image:width',
                'content'  => 1200,
            ])
            ->addRaw([
                'tag'      => 'meta',
                'property' => 'og:image:height',
                'content'  => 630,
            ])
            ->addRaw([
                'tag'      => 'meta',
                'property' => 'og:site_name',
                'content'  => APP_NAME,
            ])
            ->addRaw([
                'tag'      => 'meta',
                'property' => 'og:url',
                'content'  => site_url(),
            ])
            ->addRaw([
                'tag'      => 'meta',
                'property' => 'og:description',
                'content'  => '@todo',
            ])
            ->addRaw([
                'tag'      => 'meta',
                'property' => 'fb:app_id',
                'content'  => '@todo',
            ])
            ->addRaw([
                'tag'     => 'meta',
                'name'    => 'theme-color',
                'content' => '#ffffff',
            ]);

        // --------------------------------------------------------------------------

        // Twitter card config
        $oMeta
            ->addRaw([
                'name'    => 'twitter:card',
                'content' => 'summary_large_image',
            ])
            ->addRaw([
                'name'    => 'twitter:site',
                'content' => '@todo',
            ])
            ->addRaw([
                'name'    => 'twitter:title',
                'content' => '@todo',
            ])
            ->addRaw([
                'name'    => 'twitter:description',
                'content' => '@todo.',
            ])
            ->addRaw([
                'name'    => 'twitter:image',
                'content' => site_url('/assets/img/share/twitter.jpg'),
            ]);

        // --------------------------------------------------------------------------

        return $this;
    }
}
