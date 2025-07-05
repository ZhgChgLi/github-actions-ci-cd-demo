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
	bundle config set path 'vendor/bundle'
	bundle install
	@echo "🔨 Installing Mint dependencies..."
	mint bootstrap


## Install
.PHONY: install
install: XcodeGen PodInstall

.PHONY: XcodeGen
XcodeGen: check-mint
	@echo "🔨 Execute XcodeGen"
	cd $(PRODUCT_FOLDER) && \
	$(MINT) run yonaskolb/XcodeGen --quiet

.PHONY: PodInstall
PodInstall:
	@echo "📦 Installing CocoaPods dependencies..."
	cd $(PRODUCT_FOLDER) && \
	bundle exec pod install

### Mint
check-mint: check-brew
	@if ! command -v $(MINT) &> /dev/null; then \
		echo "🔨 Installing mint..."; \
		brew install mint; \
	fi

### Brew
check-brew:
	@if ! command -v brew &> /dev/null; then \
		echo "🔨 Installing Homebrew..."; \
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	fi

## Format only git swift files
.PHONY: format
format: check-mint
	$(MINT) run swiftformat $(PRODUCT_FOLDER)