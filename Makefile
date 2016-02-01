default:
	@echo 'make [remote|push|subtree]'
remote:
	git remote add -f viewport git@github.com:yanni4night/odin-solution-viewport.git
push:
	git push origin master
subtree:
	git subtree push --prefix=solutions/viewport viewport master