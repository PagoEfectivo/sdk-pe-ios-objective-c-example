//
//  AppDelegate.m
//  exampleSDK
//
//  Created by Andres on 10/18/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import "AppDelegate.h"
#import "PagoEfectivoSDK/PagoEfectivoSDK.h"
#import "IQKeyboardManager/IQKeyboardManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [PagoEfectivoSDK config:@"Nfybo8h0yN7CFN1ycX+XaG99pj/y3Vt25urt1LXM"
                  accessKey:@"AKIPJP77AHN2DKVIJCCA"
                  serviceId:5];
    [[IQKeyboardManager sharedManager] isEnabled];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
    return YES;
}
@end
