default:
	@echo 'make [remote|push|subpush|subpull]'
remote:
	git remote add -f viewport git@github.com:odin-solution/odin-solution-viewport.git
	git remote add -f media-query git@github.com:odin-solution/odin-solution-media-query.git
	git remote add -f font git@github.com:odin-solution/odin-solution-font.git
	git remote add -f animate git@github.com:odin-solution/odin-solution-animate.git
	git remote add -f audio git@github.com:odin-solution/odin-solution-audio.git
	git remote add -f event git@github.com:odin-solution/odin-solution-event.git
	git remote add -f lazyload git@github.com:odin-solution/odin-solution-lazyload.git
	git remote add -f date-format git@github.com:odin-solution/odin-solution-date-format.git
push:
	git push origin master
subpush:
	git subtree push --prefix=solutions/viewport viewport master
	git subtree push --prefix=solutions/media-query media-query master
	git subtree push --prefix=solutions/font font master
	git subtree push --prefix=solutions/animate animate master
	git subtree push --prefix=solutions/audio audio master
	git subtree push --prefix=solutions/event event master
	git subtree push --prefix=solutions/lazyload lazyload master
	git subtree push --prefix=solutions/date-format date-format master
subpull:
	git subtree pull --prefix=solutions/viewport viewport master
	git subtree pull --prefix=solutions/media-query media-query master
	git subtree pull --prefix=solutions/font font master
	git subtree pull --prefix=solutions/animate animate master
	git subtree pull --prefix=solutions/event event master
	git subtree pull --prefix=solutions/lazyload lazyload master
	git subtree pull --prefix=solutions/date-format date-format master
