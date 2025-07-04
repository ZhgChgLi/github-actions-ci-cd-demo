#!make
PRODUCT_FOLDER = ./Product/
CURRENT_PATH   = $(PWD)
SHELL         := /bin/bash
.DEFAULT_GOAL := install
MINT          := $(HOME)/.mint/bin/mint 

## Setup
.PHONY: setup
setup:
	@echo "🔨 Installing Ruby dependencies..."
	bundle install
	@echo "🔨 Installing Mint dependencies..."
	mint bootstrap


## Install
.PHONY: install
install: XcodeGen

.PHONY: XcodeGen
XcodeGen: $(MINT)
	@echo "🔨 Execute XcodeGen"
	cd $(PRODUCT_FOLDER) && \
	$(MINT) run yonaskolb/XcodeGen --quiet

	@echo "📦 Installing CocoaPods dependencies..."
	cd $(PRODUCT_FOLDER) && \
	bundle exec pod install

### Mint	
$(MINT):
	brew install mint