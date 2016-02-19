SOURCES=$(wildcard *.org)
OBJECTS=$(patsubst %.org,%.html,$(SOURCES))

all: $(OBJECTS)

%.html: %.org
	emacs --batch --eval "(require 'org)" $< -f org-html-export-to-html --kill

