//
//  Fix.h
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 11/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Fix : NSObject
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

- (CLLocationCoordinate2D)coordinate;
@end
