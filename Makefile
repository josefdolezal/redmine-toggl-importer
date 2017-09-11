bootstrap: fetch project

fetch:
	swift package fetch

build:
	swift build

clean:
	swift package clean
	swift package reset
	rm -rf ./.build

project:
	swift package generate-xcodeproj --xcconfig-overrides Configuration.xcconfig
	