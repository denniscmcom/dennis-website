.PHONY: all
all:
	rm -rf build
	mkdir build
	pandoc -s -c style.css src/index.md -o build/index.html 
	cp www/style.css build/style.css

