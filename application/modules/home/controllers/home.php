<?php

use Nails\Factory;
use App\Controller\Base;

class Home extends Base
{
    /**
     * Index Page for this controller.
     *
     * Maps to the following URL:
     *
     *      http://example.com/home/index
     *
     * index() is a special method name and is the default to be
     * called if the second segment of the URL is blank. i.e it
     * also maps to:
     *
     *      http://example.com/home
     *
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at:
     *
     *     http://example.com/
     *
     */
    public function index()
    {
        /**
         * To override the default Nails header you can create a view
         * at `application/views/structure/header/default`.
         *
         * Alternatively you can set $this->data['headerOverride'] to
         * the view you wish to load.
         *
         * The same rules apply to the footer, but substitute the word
         * header with footer.
         */

        $this->data['headerOverride'] = 'structure/header/blank';
        $this->data['footerOverride'] = 'structure/footer/blank';

        $oView = Factory::service('View');
        $oView->load('structure/header', $this->data);
        $oView->load('home/index', $this->data);
        $oView->load('structure/footer', $this->data);
    }
}
