SHELL = /bin/bash -o pipefail
project = CKPickerView

# Test Parameters
PLATFORM ?= iOS Simulator
NAME ?= iPhone 6
OS ?= 9.0
DESTINATION ?= platform=$(PLATFORM),name=$(NAME),OS=$(OS)


ifeq ($(TRAVIS_CI),true)

ifeq ($(TRAVIS_MATRIX_LEADER),true)
test: test-unit test-carthage test-cocoapods
else
test: test-unit
endif

else
test: test-unit test-carthage test-cocoapods
endif

test-unit:
	xcodebuild test -scheme $(project) -destination "$(DESTINATION)" ONLY_ACTIVE_ARCH=NO OBJROOT=$(PWD)/build SYMROOT=$(PWD)/build | xcpretty

test-carthage:
	carthage build --verbose --no-skip-current | xcpretty

test-cocoapods:
	pod lib lint $(project).podspec

bootstrap:
	bundle install

   # Detect Travis CI, see http://docs.travis-ci.com/user/environment-variables/
ifeq ($(TRAVIS_CI),true)
   # Cannot brew install carthage on Travis-CI
	curl -OL https://github.com/Carthage/Carthage/releases/download/0.8/Carthage.pkg
	sudo /usr/sbin/installer -pkg Carthage.pkg -target /
else
	brew install carthage
endif

deps:
	carthage bootstrap --verbose | xcpretty

release:
	zip -r -9 $(project).framework.zip Carthage/Build/iOS/*.framework

clean:
	git clean -xfd
	git submodule foreach git clean -xfd
	rm -rf  ~/Library/Developer/Xcode/DerivedData/$(project)-*

.PHONY: all clean test test-unit test-carthage test-cocoapods bootstrap deps release
