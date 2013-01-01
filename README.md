# GPX Parser

Parser GPX & TCX files for iOS application

## How to use

Parse a GPX file:

	NSData *fileData = ...
	[GPXParser parse:fileData completion:^(BOOL success, GPX *gpx) {
		// success indicates completion
		// gpx is the parsed file
	}];

Parse a TCX file:

	NSData *fileData = ...
	[TCXParser parse:fileData completion:^(BOOL success, GPX *tcx) {
		// success indicates completion
		// tcx is the parsed file
	}];

## Creator

Jelle Vandebeeck

- Twitter: [@fousa](http://twitter.com/fousa)
- App.net: [@fousa](http://alpha.app.net/fousa)
- Website: [fousa.be](http://fousa.be)