<?php

/**
 * COMMIT THIS FILE!
 *
 * All constants set in this file should read from env vars defined in docker-compose.override.yml.
 * Ensure that TESTING values are set in the committed version of docker-compose.override.yml; deployments
 * will overwrite docker-compose.override.ym with env appropriate values.
 */

// --------------------------------------------------------------------------

//  Environment
define('ENVIRONMENT', getenv('ENVIRONMENT'));
define('BASE_URL', 'https://' . getenv('DOMAIN') . '/');
define('DEPLOY_PRIVATE_KEY', getenv('PRIVATE_KEY'));

// --------------------------------------------------------------------------

//  Database
define('DEPLOY_DB_HOST', getenv('DB_HOST'));
define('DEPLOY_DB_USERNAME', getenv('DB_USERNAME'));
define('DEPLOY_DB_PASSWORD', getenv('DB_PASSWORD'));
define('DEPLOY_DB_DATABASE', getenv('DB_DATABASE'));

// --------------------------------------------------------------------------

//  Email
define('EMAIL_HOST', getenv('MAIL_HOST'));
define('EMAIL_USERNAME', getenv('MAIL_USERNAME'));
define('EMAIL_PASSWORD', getenv('MAIL_PASSWORD'));
define('EMAIL_PORT', getenv('MAIL_PORT'));
define('EMAIL_WHITELIST', getenv('MAIL_WHITELIST'));

// --------------------------------------------------------------------------

//  Deployment Revision
define('DEPLOY_REVISION', getenv('DEPLOY_REVISION'));

// --------------------------------------------------------------------------

//  Rollbar
define('DEPLOY_ROLLBAR_ACCESS_TOKEN', getenv('ROLLBAR_ACCESS_TOKEN'));
define('DEPLOY_ROLLBAR_ACCESS_TOKEN_JS', getenv('ROLLBAR_ACCESS_TOKEN_JS'));