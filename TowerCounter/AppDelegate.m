//
//  AppDelegate.m
//  TowerCounter
//
//  Created by Елена on 27.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    locationManager=[[CLLocationManager alloc] init];
    locationManager.delegate=self;
    locationManager.desiredAccuracy= kCLLocationAccuracyNearestTenMeters;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    
     lastLoc = [[CLLocation alloc] init];
    
    towerInfo = [[NSMutableArray alloc] init ];
    [locationManager startMonitoringSignificantLocationChanges];
    //[locationManager startUpdatingLocation];
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter]	
     addObserver: self
     selector: @selector(clearTowerArray)
     name: @"clearTowerArray"
     object: nil];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    
    //lastLoc = [[CLLocation alloc] initWithCoordinate:newLocation.coordinate altitude:newLocation.altitude horizontalAccuracy:newLocation.horizontalAccuracy verticalAccuracy:newLocation.verticalAccuracy course:newLocation.course speed:newLocation.speed timestamp:newLocation.timestamp];
    
   // NSLog(@"%@", lastLoc.coordinate.longitude);
    NSDate * today = [NSDate dateWithTimeIntervalSinceNow: 0];
    NSDateFormatter * date_format = [[NSDateFormatter alloc] init] ;
    // установили стиль форматирования - сокращённая дата
    [date_format setDateFormat: @"dd MMM HH:mm"];
    NSString * date_string = [date_format stringFromDate: today]; 
    
    NSDictionary *locInfo = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects: date_string, [NSString stringWithFormat: @"%.6f", newLocation.coordinate.latitude], [NSString stringWithFormat: @"%.6f",newLocation.coordinate.longitude],nil] forKeys:[NSArray arrayWithObjects:@"date", @"latitude", @"longitude", nil]];
    
    [towerInfo addObject:locInfo];
   // NSLog(@"%@", towerInfo);
    [[NSNotificationCenter defaultCenter] postNotificationName: @"newTower" object:  towerInfo];


    
}

- (void)clearTowerArray{
    [towerInfo removeAllObjects];
}





@end
