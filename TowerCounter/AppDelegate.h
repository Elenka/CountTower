//
//  AppDelegate.h
//  TowerCounter
//
//  Created by Елена on 27.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    CLLocation *lastLoc;
    NSMutableArray *towerInfo;
}

@property (strong, nonatomic) UIWindow *window;


@end
