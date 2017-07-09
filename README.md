# Nails Skeleton App

This is a skeleton app for Nails, the absolute basics for a Nails application. Update this README file with details about your project.


## Basic Setup

The [Nails Command Line Tool](https://github.com/nailsapp/command-line-tool) is a helpful tool to make dealing with your Nails apps a total breeze. If you haven't already, install it like so using [Homebrew](http://brew.sh):

    brew tap nailsapp/utilities
    brew install nails

For other operating systems, or a manual install, please see instructions on the [tool's homepage](https://github.com/nailsapp/command-line-tool).

You can now setup the project simply and easily using:

    nails install

If you wish to upgrade to the latest version of your dependencies then execute:

    nails upgrade

Finally, if at any time you wish to migrate the database then simply execute:

    nails db:migrate


## Compiling Styles and JS

Included in the skeleton are optional Gulp files for compiling your Sass and JS files. By default compiled files are ignored from VCS so as to minimise conflicts.

Firstly, let's make sure you have Bower. If not, let's install it globally:

    npm install -g bower

Great, now let's install the asset dependencies:

    bower install

Install the compiling dependencies of your project:

    npm install

The following `gulp` task is available for compiling your Sassinto CSS and for minifying your JS and generating sourcemaps:

    gulp build

You can see all available gulp commands by inspecting `gulpfile.js`.


If you want to watch for changes in `*.scss` and `*.js` files then simply call `gulp` with no arguments:

    gulp

