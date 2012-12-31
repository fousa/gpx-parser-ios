//
//  Track.h
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 19/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Track : NSObject
@property (nonatomic, strong) NSMutableArray *fixes;
@property (nonatomic, strong) MKPolyline *path;
@property (nonatomic, strong) MKPolyline *shadowPath;

@property (nonatomic, assign) MKCoordinateRegion region;
@end