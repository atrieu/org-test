SOURCES=$(wildcard *.org)
OBJECTS=$(patsubst %.org,%.html,$(SOURCES))

all: ~/.emacs $(OBJECTS)

~/.emacs:
	echo "(setq org-src-fontify-natively t)" >> ~/.emacs
	echo "(setq org-html-htmlize-output-type 'css)" >> ~/.emacs
	echo "(setq org-html-htmlize-font-prefix \"org-\")" >> ~/.emacs

%.html: %.org
	emacs --batch -eval "(require 'org)" -eval "(require 'proof-site)" $< -f org-html-export-to-html --kill
	
