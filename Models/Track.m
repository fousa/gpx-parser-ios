//
//  Track.m
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 19/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import "Track.h"

@implementation Track
@synthesize region=_region;
@synthesize fixes=_fixes;
@synthesize path=_path;
@synthesize shadowPath=_shadowPath;

#pragma mark - Initialization

- (id)init {
    if (self = [super init]) {
        self.fixes = [NSMutableArray array];
    }
    return self;
}

#pragma mark - String

- (NSString *)description {
    return [NSString stringWithFormat:@"<Track (fixes %i)>", _fixes.count];
}

@end
