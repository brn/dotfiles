SHELL:=/bin/bash
ELISPS:=$(wildcard *.el)
BUILD_DIR=cmp
BYTE_COMPILED_FILES=$(ELISPS:.el=.elc)
CURRENT_PATH=$(shell cd ../elisps && pwd)
all: $(BUILD_DIR) $(patsubst %,$(BUILD_DIR)/%,$(BYTE_COMPILED_FILES))

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

$(BUILD_DIR)/%.elc: %.el
	LOAD_PATH=$$(for DIR in $$(ls $(CURRENT_PATH)); do if [ -d $(CURRENT_PATH)/$${DIR} ]; then echo " -L $(CURRENT_PATH)/$${DIR}"; fi; done);\
	for ELISP in $<; do\
		emacs --batch $${LOAD_PATH} -f batch-byte-compile $${ELISP};\
		elc=$${ELISP/.el/.elc};\
		if [ -e $$elc ]; then\
			mv $$elc ./cmp/;\
		fi;\
	done

clean:
	rm -r cmp

.PHONY: all clean
