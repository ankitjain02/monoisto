//
//  MIFacebookManager.h
//  Monoisto
//
//  Created by vishal jain on 28/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

/*
 Facebook Graph API Link
 https://developers.facebook.com/docs/graph-api/reference/user
 
 Below is the Important link for iOS Facebook Integration
 https://developers.facebook.com/docs/ios/getting-started/
 
 App Dashboard
 https://developers.facebook.com/apps/360709761031732/dashboard/
 
 Facebook Login
 https://developers.facebook.com/quickstarts/360709761031732/?platform=ios
 
 */
#import <Foundation/Foundation.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface MIFacebookManager : NSObject

+(instancetype _Nullable )sharedManager;

#pragma mark - Login or User Profile
-(BOOL)isUserFBLoggedIn;
-(void)getUserFBProfileDataWithCompletionHandler:(nullable void (^) (id _Nullable result, NSError * _Nullable error))completion;

@end
