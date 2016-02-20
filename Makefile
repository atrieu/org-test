SOURCES=$(wildcard *.org)
OBJECTS=$(patsubst %.org,%.html,$(SOURCES))

all: ~/.emacs.d/init.el $(OBJECTS)

~/.emacs.d/init.el:
	mkdir ~/.emacs.d
	echo "(require 'org)" >> ~/.emacs.d/init.el
	echo "(require 'coq)" >> ~/.emacs.d/init.el
	echo "(setq org-src-fontify-natively t)" >> ~/.emacs.d/init.el
	echo "(setq org-html-htmlize-output-type 'css)" >> ~/.emacs.d/init.el
	echo "(setq org-html-htmlize-font-prefix \"org-\")" >> ~/.emacs.d/init.el
	echo "(setq org-confirm-babel-evaluate nil)" >> ~/.emacs.d/init.el

%.html: %.org
	emacs --batch -eval "(add-to-list 'load-path \"./\")" $< -f org-html-export-to-html --kill
