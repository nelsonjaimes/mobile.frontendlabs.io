.DEFAULT_GOAL := help

newpost: ## newpost command
	@echo $(filter-out $@,$(MAKECMDGOALS))
	/bin/sh .scripts/newpost.sh $(filter-out $@,$(MAKECMDGOALS))

command: ## exec bash command
	docker-compose exec hugo sh -c "hugo new posts/$(filter-out $@,$(MAKECMDGOALS)).md"

up: ## Up services
	docker-compose up

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'