<?php
define('ENVIRONMENT', getenv('ENVIRONMENT'));
define('BASE_URL', 'https://' . getenv('DOMAIN') . '/');
define('DEPLOY_PRIVATE_KEY', getenv('PRIVATE_KEY'));
define('DEPLOY_DB_HOST', getenv('DB_HOST'));
define('DEPLOY_DB_USERNAME', getenv('DB_USERNAME'));
define('DEPLOY_DB_PASSWORD', getenv('DB_PASSWORD'));
define('DEPLOY_DB_DATABASE', getenv('DB_DATABASE'));
define('DEPLOY_EMAIL_HOST', getenv('MAIL_HOST'));
define('DEPLOY_EMAIL_USER', getenv('MAIL_USERNAME'));
define('DEPLOY_EMAIL_PASS', getenv('MAIL_PASSWORD'));
define('DEPLOY_EMAIL_PORT', getenv('MAIL_PORT'));
