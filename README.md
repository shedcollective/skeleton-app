# Nails Skeleton App

This is a skeleton app for Nails, the absolute basics for a Nails application. To do
anything exciting with this skeleton, you'll need the latest Nails dependencies.

### Using Homebrew (recommended)

The Nails [command line tool](https://github.com/nailsapp/command-line-tool) is a
nifty little gadget to make dealing with your Nails apps a total breeze. If you
haven't already, install it like so:

	brew tap nailsapp/nailsapp
	brew install nails

Next, change to this app's directory and run the Nails installer; then it's simply
a case of following the on screen instructions:

	cd /path/to/app
	nails install

### Manually

If you prefer to do things by hand then you can always issue the following manual
commands:

	cd /path/to/app
	composer update
	chmod +x nails.php
	./nailsphp install