.PHONY: clear pdf

in-file:=sample

all: pdf

clear:
	-rm $(in-file).pdf
	-rm -r plantuml-images/

pdf:
	docker run -it --rm -v $(CURDIR):/workspace \
		ysogabe/alpine-pandoc-ja pandoc $(in-file).md \
		-f markdown \
		-o output/$(in-file).pdf \
		-V documentclass=ltjarticle \
		--pdf-engine=lualatex \
		--filter /usr/share/plantuml/plantuml.py
