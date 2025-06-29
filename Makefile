pandoc = pandoc -s -c /style.css -B www/header.html -A www/footer.html 

.PHONY: all
all:
	rm -rf build
	mkdir build
	mkdir build/blog
	cp www/style.css build/style.css
	$(pandoc) src/index.md -o build/index.html 
	$(pandoc) src/blog/index.md -o build/blog/index.html
	$(pandoc) src/blog/001_hello_world.md -o build/blog/001_hello_world.html

.PHONY: dev
dev:
	cd build && python3 -m http.server 8080
