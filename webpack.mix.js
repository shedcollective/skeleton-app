/*
 * --------------------------------------------------------------------------
 *  Mix Asset Management
 * --------------------------------------------------------------------------
 *
 *  Mix provides a clean, fluent API for defining some Webpack build steps
 *  for your Laravel application. By default, we are compiling the Sass
 *  file for your application, as well as bundling up your JS files.
 *
 *  https://laravel-mix.com/docs/2.1/basic-example
 */

let mix = require('laravel-mix');

mix
    .js('assets/js/app.js', 'assets/build/js/')
    .js('assets/js/admin.js', 'assets/build/js/')
    .sass('assets/sass/app.scss', 'assets/build/css/')
    .sass('assets/sass/admin.scss', 'assets/build/css/')
    .setPublicPath('assets')
    .options({
        processCssUrls: false
    });
