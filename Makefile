.PHONY: help update-composer

help:
	@echo "Available targets:"
	@echo "  help			Show this help message"
	@echo "  update-composer	Update Composer and project dependencies"

update-composer:
	bin/composer.phar self-update
	bin/composer.phar update
	bin/composer.phar bump
