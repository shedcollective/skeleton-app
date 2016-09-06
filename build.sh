#!/bin/bash -e
echo 'Composer Install'
composer --no-interaction --optimize-autoloader --no-dev install
echo 'Directory Permissions'
chmod -R 0755 vendor
chmod g+w application/cache
chmod g+w application/logs
echo 'Bower Install'
bower install --config.interactive=false
echo 'Nails Migrate'
chmod +x ./vendor/nailsapp/module-console/console.php
php ./vendor/nailsapp/module-console/console.php migrate --no-interaction
echo 'NPM Install'
npm install
echo 'Compile Assets'
rm -rf assets/build/css assets/build/js
gulp build

