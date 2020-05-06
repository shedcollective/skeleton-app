#!/bin/bash -e

# --------------------------------------------------------------------------
# Test everything is available
# --------------------------------------------------------------------------
if ! [[ -x "$(command -v composer)" ]]; then
    echo 'ERROR: composer is not installed.' >&2
    exit 1
elif ! [[ -x "$(command -v yarn)" ]]; then
    echo 'ERROR: yarn is not installed.' >&2
    exit 1
fi


# --------------------------------------------------------------------------
# Make sure all dependencies are pulled down
# --------------------------------------------------------------------------
if [[ $ENVIRONMENT == "PRODUCTION" ]]; then
    composer --no-interaction --optimize-autoloader --no-dev install
    yarn install --production
else
    composer --no-interaction --optimize-autoloader install
    yarn install
fi


# --------------------------------------------------------------------------
# Ensure that the following directories have permissions set properly
# --------------------------------------------------------------------------
chmod -R 0755 ./vendor
chmod g+w ./cache/public ./cache/private ./application/logs
chmod +x ./vendor/nails/module-console/console.php


# --------------------------------------------------------------------------
# Migrate the Database
# --------------------------------------------------------------------------
if [[ $@ == "fresh" ]]; then
    php ./vendor/nails/module-console/console.php db:rebuild --no-interaction
else
    php ./vendor/nails/module-console/console.php db:migrate --no-interaction
fi


# --------------------------------------------------------------------------
# Execute the NPM build command so that all JS and CSS is compiled
# --------------------------------------------------------------------------
rm -rf assets/build/css assets/build/js
if [[ $ENVIRONMENT == "PRODUCTION" ]]; then
    yarn run production
else
    yarn run development
fi
