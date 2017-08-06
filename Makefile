bootstrap:
	swift package fetch
	swift package generate-xcodeproj

build:
	swift build