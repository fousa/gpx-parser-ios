//
//  Fix.m
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 11/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import "Fix.h"

@implementation Fix
@synthesize latitude=_latitude;
@synthesize longitude=_longitude;

#pragma mark - Coordinate

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(_latitude, _longitude);
}

#pragma mark - String

- (NSString *)description {
    return [NSString stringWithFormat:@"<Fix (%f %f)>", _latitude, _longitude];
}

@end
