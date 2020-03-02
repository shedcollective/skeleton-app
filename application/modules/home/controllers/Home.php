<?php

use App\Controller\Base;
use Nails\Common\Exception\FactoryException;
use Nails\Factory;

/**
 * Class Home
 */
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
     * @throws FactoryException
     */
    public function index(): void
    {
        //  Set a friendly page title
        $this->oMetaData->setTitles(['Welcome to Nails']);

        /**
         * To override the default Nails header you can create a view
         * at `application/views/structure/header/default`.
         *
         * The same rule applies to the footer, but substitute the word
         * header with footer.
         */
        Factory::service('View')
            ->load([
                'structure/header/blank',
                'home/index',
                'structure/footer/blank',
            ]);
    }
}
