# Default cache directory (private)

This directory is used by the app to store temporary working files, or any other data which it might need later. Contents in here is not guaranteed to be kept. The path to this directory is defined as `CACHE_PATH`.

Remember, this directory is not public; if you require access to cached, or generated data via the URL you must use the public cache directory (defined as `CACHE_PUBLIC_PATH`, and accessible via `CACHE_PUBLIC_URL`).
