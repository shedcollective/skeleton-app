#!/bin/bash -e

# Test everything is available
if ! [ -x "$(command -v composer)" ]; then
    echo 'ERROR: composer is not installed.' >&2
    exit 1
elif ! [ -x "$(command -v npm)" ]; then
    echo 'ERROR: npm is not installed.' >&2
    exit 1
elif ! [ -x "$(command -v bower)" ]; then
    echo 'ERROR: bower is not installed.' >&2
    exit 1
elif ! [ -x "$(command -v gulp)" ]; then
    echo 'ERROR: gulp is not installed.' >&2
    exit 1
fi

# Make sure all dependencies are pulled down
echo 'Installing Composer dependencies'
composer --no-interaction --optimize-autoloader --no-dev install
echo 'Installing NPM dependencies'
npm install
echo 'Installing Bower dependencies'
bower install --config.interactive=false

# Ensure that the following directories have their permissions set up properly
echo 'Directory Permissions'
chmod -R 0755 vendor
chmod g+w application/cache
chmod g+w application/logs

# If config files exist then simply migrate the database, if not, go through the installer
chmod +x ./vendor/nailsapp/module-console/console.php
if [ -f "config/app.php" ] && [ -f "config/deploy.php" ]; then
    echo 'Nails Migrate'
    php ./vendor/nailsapp/module-console/console.php migrate --no-interaction
else
    echo 'Nails Install'
    php ./vendor/nailsapp/module-console/console.php install
fi

# Execute the Gulp build command so that all Js and CSS is compiled
echo 'Compile Assets'
rm -rf assets/build/css assets/build/js
gulp build
