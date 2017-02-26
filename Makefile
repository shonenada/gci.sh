all:
	@cp ./gci.sh /usr/local/bin/gci
	@chmod +x /usr/local/bin/gci
	echo "Install successfully"
.PHONY: all

remove:
	@rm /usr/local/bin/gci
.PHONY: remove
