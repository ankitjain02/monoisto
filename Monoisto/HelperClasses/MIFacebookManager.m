//
//  MIFacebookManager.m
//  Monoisto
//
//  Created by vishal jain on 28/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import "MIFacebookManager.h"

static MIFacebookManager *sharedManager = nil;

@implementation MIFacebookManager

// Shared Instance
+(instancetype)sharedManager {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedManager = [[MIFacebookManager alloc] init];
    });
    
    return sharedManager;
}

#pragma mark - Login or User Profile

-(BOOL)isUserFBLoggedIn {
    // Facebook :: Condition to check if user already login
    if ([FBSDKAccessToken currentAccessToken]) {
        return YES;
    } else {
        return NO;
    }
}

-(void)getUserFBProfileDataWithCompletionHandler:(nullable void (^) (id result, NSError *error))completion {
    // Condition to check if user already login
    if ([self isUserFBLoggedIn]) {
        // For more complex open graph stories, use `FBSDKShareAPI`
        // with `FBSDKShareOpenGraphContent`
        /* make the API call */
        // To fetch the profile information for the person currently logged into your app
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 // profile_pic
                 NSString *userID = [result objectForKey:@"id"];
                 FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                               initWithGraphPath:[NSString stringWithFormat:@"/%@",userID]
                                               parameters:@{@"fields": @"id, name, first_name, last_name, birthday, email, gender, hometown, location"}
                                               HTTPMethod:@"GET"];
                 [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,id result,NSError *error) {
                     // Handle the result
                     if (!error) {
                         //NSLog(@"fetched user profile picture:%@", result);
                     }
                     completion(result, error);
                 }];
             } else {
                 completion(@{}, nil);
             }
         }];
    } else {
        completion(@{}, nil);
    }
}

@end
