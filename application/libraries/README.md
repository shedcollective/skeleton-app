# Note on extending native libraries

CodeIgniter cannot extend native libraries using packages, to get round this we create these 'proxy' classes which WILL be loaded by CI which in turn load the class from the Nails package.
