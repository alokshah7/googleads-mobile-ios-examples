//
//  Copyright (C) 2017 Google, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "AppDelegate.h"

#import "ViewController.h"

#import <GoogleMobileAds/GoogleMobileAds.h>

#import <AppLovinSDK/AppLovinSDK.h>

#import <InMobiAdapter/InMobiAdapter.h>

#import <UnityAds/UnityAds.h>



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ALSdk initializeSdk];

    ALSdk *sdk = [ALSdk shared];
    sdk.settings.isTestAdsEnabled = YES;
    
    GADInMobiExtras *extras = [[GADInMobiExtras alloc] init];
    extras.logLevel = kIMSDKLogLevelDebug;
    
    
    NSMutableDictionary *consentdict=[[NSMutableDictionary alloc]init];
    //consent value needs to be collected from the end user
    [consentdict setObject:@"true" forKey:IM_GDPR_CONSENT_AVAILABLE];
    [consentdict setObject:@1 forKey:@"gdpr"];
    //Initialize InMobi SDK with your account ID
    [IMSdk initWithAccountID: @"50d769a8682946a2be2e28f6d43bf0ab" consentDictionary:consentdict];
    
    [UnityAds initialize : @"3294728" delegate : self testMode : true];

    
  return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store
  // enough application state information to restore your application to its current state in case
  // it is terminated later.
  // If your application supports background execution, this method is called instead of
  // applicationWillTerminate: when the user quits.
  ViewController *viewController = (ViewController *)self.window.rootViewController;
  [viewController pauseGame];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo
  // many of the changes made on entering the background.
  ViewController *viewController = (ViewController *)self.window.rootViewController;
  [viewController resumeGame];
}

@end
