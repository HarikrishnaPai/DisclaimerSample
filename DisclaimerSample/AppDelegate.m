//
//  AppDelegate.m
//  DisclaimerSample
//
//  Created by Hari on 19/12/13.
//  Copyright (c) 2013 GTL. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "DisclaimerViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // current version of the application stored in info.plist
    NSString *currentAppVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    
    // version that we have saved to user defaults, by default it is nil
    NSString *savedAppVersion = [[NSUserDefaults standardUserDefaults] valueForKey:@"appVersion"];
    
    // check if app is installed for the first time or if the app version has been changed
    if (savedAppVersion == nil || ![savedAppVersion isEqualToString:currentAppVersion]) {
        [[NSUserDefaults standardUserDefaults] setValue:currentAppVersion forKey:@"appVersion"];
        // set the value of disclaimerAccepted to NO on first install and on version change
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"disclaimerAccepted"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    // value of disclaimerAccepted is set to YES when user accept the disclaimer terms, other wise it is NO.
    BOOL isDisclaimerAccepted = [[NSUserDefaults standardUserDefaults] boolForKey:@"disclaimerAccepted"];

    if (!isDisclaimerAccepted) {
        // if disclaimer is not accepted, show disclaimer view
        DisclaimerViewController *vc = [[DisclaimerViewController alloc] initWithNibName:@"DisclaimerViewController" bundle:nil];
        self.nav = [[UINavigationController alloc] initWithRootViewController:vc];
    }
    else {
        // if disclaimer is accepted, show default home page
        ViewController *vc = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        self.nav = [[UINavigationController alloc] initWithRootViewController:vc];
    }
    
    self.nav.navigationBarHidden    = YES;
    self.window                     = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController  = self.nav;
    [self.window makeKeyAndVisible];
    
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

@end
