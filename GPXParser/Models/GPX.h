//
//  GPX.h
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 29/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface GPX : NSObject
@property (nonatomic, strong) NSMutableArray *waypoints;
@property (nonatomic, strong) NSMutableArray *tracks;
@property (nonatomic, strong) NSMutableArray *routes;
@property (nonatomic, strong) NSString *filename;

@property (nonatomic, assign) MKCoordinateRegion region;
@property (nonatomic, assign) double distance;
@end
