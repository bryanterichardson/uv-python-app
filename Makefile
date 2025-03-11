# Static Variables
include dev.env
export

# Not real targets
.PHONY: \
	clean \
	format \
	help \
	init \
	run \
	test

#################################################################################
# Local
#################################################################################

## Show this help.
help:
	@awk '/^## .*$$/,/^[~\/\.a-zA-Z_-]+:/' ${MAKEFILE_LIST} | \
	awk '!(NR%2){print $$0p}{p=$$0}' |  \
	awk 'BEGIN {FS = ":.*?##"}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' | \
	sort

## Set up the environment to start coding
init:
	uv sync

## Remove the virtualenv
clean:
	rm -rf .venv

## Runs the pre-commit tasks against all files, automatically fixing files when it can
format: .git/hooks/pre-commit
	pre-commit run --all-files

## Runs the app locally
run:
	echo "Not setup"

## Run unit tests
test:
	uv run pytest -m "not integtest"

#################################################################################
# Python env
#################################################################################

## Generates lock file for dependencies
uv.lock: pyproject.toml
	uv lock

#################################################################################
# Meta
#################################################################################

.git/hooks/pre-commit: .pre-commit-config.yaml
	pre-commit install --overwrite
