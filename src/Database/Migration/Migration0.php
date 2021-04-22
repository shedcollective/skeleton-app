<?php

/**
 * Migration:   0
 * Started:     xxxx-xx-xx
 */

namespace Nails\Database\Migration\App;

use Nails\Common\Console\Migrate\Base;

class Migration0 extends Base
{
    /**
     * Execute the migration
     *
     * @return void
     */
    public function execute(): void
    {
        $this->query('
            DROP TABLE IF EXISTS {{NAILS_DB_PREFIX}}user_meta_app;
            CREATE TABLE `{{NAILS_DB_PREFIX}}user_meta_app` (
                `user_id` int(11) unsigned NOT NULL,
                PRIMARY KEY (`user_id`),
                CONSTRAINT `{{NAILS_DB_PREFIX}}user_meta_{{APP_DB_PREFIX}}ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `{{NAILS_DB_PREFIX}}user` (`id`) ON DELETE CASCADE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8
        ');
    }
}
