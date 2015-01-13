# Default cache directory for Nails apps.

The cache directory which the app should use must be specified in `config/deploy.php`. It is recommended,
unless there's a good reason, to use this directory for your caching needs.

Nails will check this is writeable on load and inform you via fatal error notification if it can't use it.