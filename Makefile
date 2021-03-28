sources = index.md style.css

.PHONY: clean html pdf txt sources

all: clean html txt pdf

html: $(sources)
	pandoc --standalone -H header.html -o index.html index.md

pdf: $(sources)
	pandoc --standalone --pdf-engine=wkhtmltopdf -o index.pdf index.md

txt: $(sources)
	pandoc --standalone -f markdown -t plain+smart -o index.txt index.md

clean:
	$(RM) index.txt index.pdf index.html
