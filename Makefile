.PHONY: help update-composer phpstan csfixer cs

help:
	@echo "Available targets:"
	@echo "  help			Show this help message"
	@echo "  update-composer	Update Composer and project dependencies"
	@echo "  phpstan		Run PHPStan"
	@echo "  phpstan-baseline	Generate PHPStan baseline"
	@echo "  csfixer		Check code style with PHP-CS-Fixer"
	@echo "  cs			Alias for csfixer"

update-composer:
	bin/composer.phar self-update
	bin/composer.phar update
	bin/composer.phar bump

phpstan:
	vendor/bin/phpstan analyse --configuration=phpstan.dist.neon

phpstan-baseline:
	vendor/bin/phpstan analyse --configuration=phpstan.dist.neon --generate-baseline

csfixer:
	vendor/bin/php-cs-fixer fix --config=.php-cs-fixer.dist.php --dry-run --diff

cs: csfixer
