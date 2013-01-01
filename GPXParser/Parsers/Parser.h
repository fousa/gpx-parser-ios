//
//  Parser.h
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 16/02/12.
//  Copyright (c) 2012 10to1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#import "GPX.h"

#import "Fix.h"
#import "Track.h"
#import "Waypoint.h"

@interface Parser : NSObject <NSXMLParserDelegate>
@property (nonatomic, strong) GPX *gpx;
@property (nonatomic, strong) NSMutableString *currentString;
@property (nonatomic, strong) Track *track;
@property (nonatomic, strong) Track *route;
@property (nonatomic, strong) Waypoint *waypoint;
@property (nonatomic, strong) Fix *fix;
@property (nonatomic, copy) void (^callback)(BOOL success, GPX *gpx);

+ (void)parse:(NSData *)data completion:(void(^)(BOOL success, GPX *gpx))completionHandler;
@end