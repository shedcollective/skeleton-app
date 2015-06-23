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

## Compiling Assets

Included in the skeleton is an optional Grunt file for compiling your LESS and JS files. 

Firstly, install `grunt-cli` tool globally. It's recommended to run the grunt client on a per-project basis.

    npm install -g grunt-cli

Install the dev dependancies in your project:

    npm install --dev
    
    
The following Grunt commands are available to you for compiling the LESS and the JS of your project:

	grunt build:less
	grunt build:js
	
If you want to watch for changes in \*.less and \*.js files then you can use the following:

	grunt watch:less
	grunt watch:js
	
Finally, if you want to watch *both* JS and LESS files for changes then simply issue `grunt` with no arguments:

	grunt
    