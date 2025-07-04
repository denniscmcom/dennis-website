PANDOC := pandoc -s -c /style.css -B www/header.html -A www/footer.html 
SRC_DIR := denniscm.com
BUILD_DIR := build

.PHONY: all
all: dev build

.PHONY: build
build:
	rm -rf $(BUILD_DIR)
	mkdir $(BUILD_DIR)
	mkdir $(BUILD_DIR)/blog
	cp www/style.css $(BUILD_DIR)/style.css
	$(PANDOC) $(SRC_DIR)/index.md -o $(BUILD_DIR)/index.html 
	$(PANDOC) $(SRC_DIR)/blog/index.md -o $(BUILD_DIR)/blog/index.html
	$(PANDOC) $(SRC_DIR)/blog/001_hello_world.md -o $(BUILD_DIR)/blog/001_hello_world.html

.PHONY: dev
dev: build
	cd build && python3 -m http.server 8080
