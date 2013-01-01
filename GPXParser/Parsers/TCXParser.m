//
//  TCXParser.m
//  TCX Reader
//
//  Created by Jelle Vandebeeck on 11/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import "TCXParser.h"

@implementation TCXParser

#pragma mark - XML Parser

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    // Track
    if ([elementName isEqualToString:@"Track"]) {
		if (!self.track) self.track = [Track new];
	}
    
    // Track point
    if ([elementName isEqualToString:@"Position"] && self.track) {
		if (!self.fix) self.fix = [Fix new];
	}
    
    if ([elementName isEqualToString:@"LatitudeDegrees"] && self.track && self.fix) {
        self.currentString = [NSMutableString string];
    }
    
    if ([elementName isEqualToString:@"LongitudeDegrees"] && self.track && self.fix) {
        self.currentString = [NSMutableString string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    // End track
    if([elementName isEqualToString:@"Track"] && self.track) {
        [self.gpx.tracks addObject:self.track];
		self.track = nil;
        return;
    }
    
    // End track point
    if([elementName isEqualToString:@"Position"] && self.fix && self.track) {
        [self.track.fixes addObject:self.fix];
		self.fix = nil;
        return;
    }
    
    if ([elementName isEqualToString:@"LatitudeDegrees"] && self.fix && self.track) {
        self.fix.latitude = [self.currentString doubleValue];
        self.currentString = nil;
    }
    
    if ([elementName isEqualToString:@"LongitudeDegrees"] && self.fix && self.track) {
        self.fix.longitude = [self.currentString doubleValue];
        self.currentString = nil;
    }
}
    
@end