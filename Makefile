SOURCES=$(wildcard *.org)
OBJECTS=$(patsubst %.org,%.html,$(SOURCES))

all: $(OBJECTS)

%.html: %.org
	echo "(setq org-src-fontify-natively t) >> ~/.emacs
	echo "(setq org-html-htmlize-output-type 'css)" >> ~/.emacs
	echo "(setq org-html-htmlize-font-prefix \"org-\")" >> ~/.emacs
	emacs --batch -q -eval "(require 'org)" $< -f org-html-export-to-html --kill
	
