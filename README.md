# Nails Skeleton App


This is a skeleton app for Nails, the absolute basics for a Nails application.

## Basic Setup
To do anything exciting with this skeleton, you'll need the latest Nails dependencies.

The Nails [command line tool](https://github.com/nailsapp/command-line-tool) is a nifty little gadget to make dealing with your Nails apps a total breeze. If you haven't already, install it like so:

    brew tap nailsapp/nailsapp
    brew install nails

Next, change to this app's directory and run the Nails installer; then it's simply a case of following the on screen instructions:

    cd /path/to/app
    nails install

**Note:** Now that you have the Nails Command line utility, you can start a new Nails app simply issuing `nails new app-name` in your parent directory of choice:

    cd ~/Sites
    nails new my-awesome-app

## Compiling CSS & LESS

Included in the skeleton is an optional Grunt file for compiling your LESS and JS files. 

Firstly, install `grunt-cli` tool globally. It's recommended to run the grunt client on a per-project basis.

    npm install -g grunt-cli

Install the dev dependancies in your project:

    npm install --dev
    
The following Grunt task is available for compiling your LESS into CSS and for minimising your JS:

    grunt build
    
Or, to do them individually:

	grunt build:css
	grunt build:js
	
If you want to watch for changes in \*.less and \*.js files then simply call Grunt with no arguments:

    grunt

Or, to watch only one or the other for changes:

	grunt watch:css
	grunt watch:js
	