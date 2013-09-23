build:

	@echo "Making a new Nails skeleton app"
	@echo "Replacing repository with new Git Flow enabled repo."
	@rm -rf .git/*
	@rmdir .git
	@git flow init -d
	@echo "Setting directory permissions"
	@chmod 0777 application/cache
	@chmod 0777 application/config
	@chmod 0777 assets/uploads
	@chmod 0777 settings
	@composer install
	@git add .
	@git commit -m 'Initial Commit'
	@ rm -f Makefile
	@echo "Done, go forth a code!"