test:
	yarn -s run eslint --color .
	yarn -s run jest --color

publish:
	git push -u --tags origin master
	npm publish

deps:
	rm -rf node_modules
	yarn

update:
	yarn -s run updates -cu
	$(MAKE) deps

patch: test
	yarn -s run ver -C patch
	$(MAKE) publish

minor: test
	yarn -s run ver -C minor
	$(MAKE) publish

major: test
	yarn -s run ver -C major
	$(MAKE) publish

.PHONY: test publish deps update patch minor major
