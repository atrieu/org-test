SOURCES=$(wildcard *.org)
OBJECTS=$(patsubst %.org,%.html,$(SOURCES))

all: $(OBJECTS)

%.html: %.org
	emacs --batch -q -eval "(require 'org)" -eval "(setq org-src-fontify-natively t)" -eval "(setq org-export-htmlize-output-type 'css)" -eval "(setq org-html-htmlize-font-prefix \"org-\")" $< -f org-html-export-to-html --kill

