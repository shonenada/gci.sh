TARGET="/usr/local/bin/gci"

ifeq ($(shell uname -s),Darwin)
	checksum = md5 -q $1 2>/dev/null
else
	checksum = md5sum $1 | awk '{print $$1}' 2>/dev/null
endif

gci_checksum = $(shell $(call checksum,gci.sh))

ensure_clean = \
  @if [ -f "$(TARGET)" ]; then \
	bin_sum=$(shell $(call checksum,$(TARGET))); \
	if [ $$bin_sum != $(gci_checksum) ]; then \
	  echo "Failed to install gci" ;\
	  echo "$(TARGET) seems different from gci.sh "; \
	  exit 1;\
	fi; \
  fi

ensure_same = \
  @if [ ! -f "$(TARGET)" ] || [ $(gci_checksum) != $(shell $(call checksum,$(TARGET))) ]; then \
	echo "Failed to remove gci" ;\
	echo "$(TARGET) seems different from gci.sh "; \
	exit 1;\
  fi

install: gci.sh
	$(ensure_clean)
	@cp ./gci.sh /usr/local/bin/gci
	@chmod +x /usr/local/bin/gci
	@echo "Install successfully"
.PHONY: install

checksum:
	@echo $(gci_checksum)
.PHONY: checksum

remove:
	$(ensure_same)
	@rm /usr/local/bin/gci
.PHONY: remove
