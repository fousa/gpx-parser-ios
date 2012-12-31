//
//  GPXParser.m
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 11/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import "GPXParser.h"

@implementation GPXParser

#pragma mark - XML Parser

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    // Track
    if ([elementName isEqualToString:@"trk"]) {
		if (!self.track) self.track = [Track new];
	}
    
    // Track point
    if ([elementName isEqualToString:@"trkpt"] && self.track) {
		if (!self.fix) {
            self.fix = [Fix new];
            self.fix.latitude = [[attributeDict objectForKey:@"lat"] doubleValue];
            self.fix.longitude = [[attributeDict objectForKey:@"lon"] doubleValue];
        }
	}
    
    // Waypoint
    if ([elementName isEqualToString:@"wpt"]) {
		if (!self.waypoint) {
            self.waypoint = [Waypoint new];
            self.waypoint.latitude = [[attributeDict objectForKey:@"lat"] doubleValue];
            self.waypoint.longitude = [[attributeDict objectForKey:@"lon"] doubleValue];
        }
	}
    
    // Waypoint name
    if ([elementName isEqualToString:@"desc"] &&  self.waypoint) {
        self.currentString = [NSMutableString string];
    }
    
    // Route
    if ([elementName isEqualToString:@"rte"]) {
		if (!self.route) self.route = [Track new];
	}
    
    // Route point
    if ([elementName isEqualToString:@"rtept"] && self.route) {
		if (!self.fix) {
            self.fix = [Fix new];
            self.fix.latitude = [[attributeDict objectForKey:@"lat"] doubleValue];
            self.fix.longitude = [[attributeDict objectForKey:@"lon"] doubleValue];
        }
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    // End track
    if([elementName isEqualToString:@"trk"] && self.track) {
        [self.gpx.tracks addObject:self.track];
		self.track = nil;
        return;
    }
    
    // End track point
    if([elementName isEqualToString:@"trkpt"] && self.fix && self.track) {
        [self.track.fixes addObject:self.fix];
		self.fix = nil;
        return;
    }
    
    // Waypoint name
    if ([elementName isEqualToString:@"desc"] && self.waypoint) {
        self.waypoint.name = self.currentString;
        self.currentString = nil;
    }
    
    // End waypoint
    if([elementName isEqualToString:@"wpt"] && self.waypoint) {
        [self.gpx.waypoints addObject:self.waypoint];
		self.waypoint = nil;
        return;
    }
    
    // End track
    if([elementName isEqualToString:@"rte"] && self.route) {
        [self.gpx.routes addObject:self.route];
		self.route = nil;
        return;
    }
    
    // End Route point
    if([elementName isEqualToString:@"rtept"] && self.fix && self.route) {
        [self.route.fixes addObject:self.fix];
		self.fix = nil;
        return;
    }
}
    
@end