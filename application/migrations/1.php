<?php

/**
 * Migration:   1
 * Started:     xxxx-xx-xx
 */

namespace Nails\Database\Migration\App;

use Nails\Auth\Model\User;
use Nails\Cms\Model\Block;
use Nails\Common\Console\Migrate\Base;
use Nails\Common\Exception\FactoryException;
use Nails\Common\Exception\ModelException;
use Nails\Factory;

class Migration1 extends Base
{
    /**
     * The ID of the SuperUser group
     *
     * @var int
     */
    const USER_GROUP_SUPERUSER = 1;

    /**
     * The ID of the administrator group
     *
     * @var int
     */
    const USER_GROUP_ADMIN = 2;

    // --------------------------------------------------------------------------

    /**
     * Execute the migration
     *
     * @throws FactoryException
     * @throws ModelException
     */
    public function execute(): void
    {
        $this
            // ->addCmsBlocks()
            // ->addCmsMenu()
            // ->addCmsPages()
            ->addUsers();
    }

    // --------------------------------------------------------------------------

    /**
     * Adds initial users
     *
     * @return $this
     * @throws FactoryException
     */
    protected function addUsers(): self
    {
        $aUsers = [
            [
                'first_name' => 'Pablo',
                'last_name'  => 'de la Peña',
                'email'      => 'p@shedcollective.org',
                'username'   => 'pablo',
                'group_id'   => static::USER_GROUP_SUPERUSER,
            ],
            [
                'first_name' => 'Gary',
                'last_name'  => 'Duncan',
                'email'      => 'g@shedcollective.org',
                'username'   => 'gary',
                'group_id'   => static::USER_GROUP_SUPERUSER,
            ],
            [
                'first_name' => 'Shaun',
                'last_name'  => 'McWhinnie',
                'email'      => 'shaun@shedcollective.org',
                'username'   => 'shaun',
                'group_id'   => static::USER_GROUP_SUPERUSER,
            ],
            [
                'first_name' => 'Michaela',
                'last_name'  => 'Drake',
                'email'      => 'michaela@shedcollective.org',
                'username'   => 'michaela',
                'group_id'   => static::USER_GROUP_SUPERUSER,
            ],
        ];

        /** @var User $oModel */
        $oModel = Factory::model('User', 'nails/module-auth');
        foreach ($aUsers as $aUser) {
            $aUser['temp_pw'] = true;
            $oModel->create($aUser, false);
        }
        return $this;
    }

    // --------------------------------------------------------------------------

    /**
     * Add initial CMS Blocks
     *
     * @return $this
     * @throws FactoryException
     * @throws ModelException
     */
    protected function addCmsBlocks(): self
    {
        $aBlocks = [
            [
                'label' => 'Example CMS Block',
                'type'  => 'plaintext',
                'value' => null,
            ],
        ];

        /** @var Block $oModel */
        $oModel = Factory::model('Block', 'nails/module-cms');
        foreach ($aBlocks as $aBlock) {

            $aBlock['slug'] = strtolower($aBlock['label']);
            $aBlock['slug'] = preg_replace('/[^a-z ]/', '', $aBlock['slug']);
            $aBlock['slug'] = trim($aBlock['slug']);
            $aBlock['slug'] = preg_replace('/\s{1,}/', '-', $aBlock['slug']);
            $aBlock['slug'] = trim($aBlock['slug']);

            $oModel->create($aBlock);
        }

        return $this;
    }

    // --------------------------------------------------------------------------

    /**
     * Add initial CMS Menus
     *
     * @return $this
     * @throws FactoryException
     * @throws ModelException
     */
    protected function addCmsMenu(): self
    {
        $aMenus = [
            [
                'label' => 'Example CMS Block',
            ],
        ];

        /** @var Block $oModel */
        $oModel = Factory::model('Menu', 'nails/module-cms');
        foreach ($aMenus as $aMenu) {
            $oModel->create($aMenu);
        }

        return $this;
    }

    // --------------------------------------------------------------------------

    /**
     * Add initial CMS Pages
     *
     * @return $this
     * @throws FactoryException
     * @throws ModelException
     */
    protected function addCmsPage(): self
    {
        $aPages = [
            [
                'label' => 'Example CMS Block',
            ],
        ];

        /** @var Block $oModel */
        $oModel = Factory::model('Page', 'nails/module-cms');
        foreach ($aPages as $aPage) {
            $oModel->create($aPage);
        }

        return $this;
    }
}
