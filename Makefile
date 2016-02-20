SOURCES=$(wildcard *.org)
OBJECTS=$(patsubst %.org,%.html,$(SOURCES))

all: $(OBJECTS)

%.html: %.org
	emacs --batch --eval "(require 'org)" --eval "(require 'htmlize)" --eval "(setq org-src-fontify-natively t)" $< -f org-html-export-to-html --kill

