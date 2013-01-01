//
//  Waypoint.m
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 19/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import "Waypoint.h"

@implementation Waypoint
@synthesize name=_name;
@synthesize type=_type;

#pragma mark - String

- (NSString *)description {
    return [NSString stringWithFormat:@"<Waypoint (%@ %f %f)>", _name, self.latitude, self.longitude];
}

@end
