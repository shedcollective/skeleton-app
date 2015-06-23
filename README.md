# Nails Skeleton App

This is a skeleton app for Nails, the absolute basics for a Nails application. To do anything exciting with this skeleton, you'll need the latest Nails dependencies.

## Configuration

The Nails [command line tool](https://github.com/nailsapp/command-line-tool) is a nifty little gadget to make dealing with your Nails apps a total breeze. If you haven't already, install it like so:

    brew tap nailsapp/nailsapp
    brew install nails

Next, change to this app's directory and run the Nails installer; then it's simply a case of following the on screen instructions:

    cd /path/to/app
    nails install

**Note:** Now that you have the Nails Command line utility, you can start a new Nails app simply issuing `nails new app-name` in your parent directory of choice.

## Compiling Assets

Included in the skeleton is an optional Grunt file for compiling your LESS and JS files. Use it like so:

Firstly, install `grunt-cli` tool globally. It's recommended to run the grunt client on a per-project basis.

    npm install -g grunt-cli

Install the dev dependancies:

    npm install --dev
    
Calling grunt in the project root will start the watcher causing changes to the JS to be compiled automatically.

    grunt
    
If you want to compile just the LESS do this:

	grunt watch-less
	
And likewise, if you want to justc ompile the JS do this:

	grunt watch-js