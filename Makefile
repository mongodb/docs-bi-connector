GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
USER=$(shell whoami)
STAGING_URL="https://docs-mongodborg-staging.corp.mongodb.com"
PRODUCTION_URL="https://docs.mongodb.com"
STAGING_BUCKET=docs-mongodb-org-staging
PRODUCTION_BUCKET=docs-bi-connector-prod
PROJECT=bi-connector
PREFIX=bi-connector
STGPREFIX=bi-connector
DOTCOM_STAGING_URL="https://mongodbcom-cdn.website.staging.corp.mongodb.com"
DOTCOM_STAGING_BUCKET=docs-mongodb-org-dotcomstg
DOTCOM_PRODUCTION_URL="https://mongodb.com"
DOTCOM_PRODUCTION_BUCKET=docs-mongodb-org-dotcomprd
DOTCOM_PREFIX=docs-qa/bi-connector
DOTCOM_STGPREFIX=docs-qa/bi-connector

# Parse our published-branches configuration file to get the name of
# the current "stable" branch. This is weird and dumb, yes.
STABLE_BRANCH=`grep 'manual' build/docs-tools/data/${PROJECT}-published-branches.yaml | cut -d ':' -f 2 | grep -Eo '[0-9a-z.]+'`

.PHONY: help html publish stage deploy deploy-search-index

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo
	@echo 'Variables'
	@printf "  \033[36m%-18s\033[0m %s\n" 'ARGS' 'Arguments to pass to mut-publish'

html: ## Builds this branch's HTML under build/<branch>/html
	giza make html

publish: ## Builds this branch's publishable HTML and other artifacts under build/public
	giza make publish
	if [ ${GIT_BRANCH} = master ]; then mut-redirects config/redirects -o build/public/.htaccess; fi

stage: ## Host online for review
	mut-publish build/${GIT_BRANCH}/html ${STAGING_BUCKET} --prefix=${STGPREFIX} --stage ${ARGS}
	@echo "Hosted at ${STAGING_URL}/${STGPREFIX}/${USER}/${GIT_BRANCH}/index.html"

	mut-publish build/${GIT_BRANCH}/html ${DOTCOM_STAGING_BUCKET} --prefix=${DOTCOM_STGPREFIX} --stage ${ARGS}
	@echo "Hosted at ${DOTCOM_STAGING_URL}/${DOTCOM_STGPREFIX}/${USER}/${GIT_BRANCH}/index.html"

	

deploy: build/public ## Deploy to the production bucket
	mut-publish build/public ${PRODUCTION_BUCKET} --prefix=${PREFIX} --deploy --redirect-prefix='bi-connector' ${ARGS}

	@echo "Hosted at ${PRODUCTION_URL}/${STGPREFIX}/index.html"

	mut-publish build/public ${DOTCOM_PRODUCTION_BUCKET} --prefix=${DOTCOM_PREFIX} --deploy --redirect-prefix='bi-connector' ${ARGS}

	@echo "Hosted at ${DOTCOM_PRODUCTION_URL}/${DOTCOM_PREFIX}/index.html"


	$(MAKE) deploy-search-index

deploy-search-index: ## Update the search index for this branch
	@echo "Building search index"
	if [ ${STABLE_BRANCH} = ${GIT_BRANCH} ]; then \
		mut-index upload build/public/${GIT_BRANCH} -o bi-connector-current.json --aliases bi-connector-${GIT_BRANCH} -u ${PRODUCTION_URL}/${PROJECT}/current -g -s; \
	else \
		mut-index upload build/public/${GIT_BRANCH} -o bi-connector-${GIT_BRANCH}.json -u ${PRODUCTION_URL}/${PROJECT}/${GIT_BRANCH} -s; \
	fi

redirects:
	if [ ${GIT_BRANCH} = master ]; then mut-redirects config/redirects -o build/public/.htaccess; fi
