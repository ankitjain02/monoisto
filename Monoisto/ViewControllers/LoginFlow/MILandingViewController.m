//
//  MILandingViewController.m
//  Monoisto
//
//  Created by vishal jain on 20/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import "MILandingViewController.h"
#import "MITabBarViewController.h"
#import "MIFacebookManager.h"

@interface MILandingViewController ()

@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@property (weak, nonatomic) IBOutlet UIButton *signinButton;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;

@end

@implementation MILandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // test
    self.facebookButton.layer.cornerRadius = 8.0f;
    self.signinButton.layer.cornerRadius = 8.0f;
    self.signupButton.layer.cornerRadius = 8.0f;
    
    // Facebook :: Condition to check if user already login
    if ([FBSDKAccessToken currentAccessToken]) {
        
        // Fetch Profile Data & Picture
        [[MIFacebookManager sharedManager] getUserFBProfileDataWithCompletionHandler:^(id  _Nullable result, NSError * _Nullable error) {
            // Handle the result
            if (!error) {
                NSLog(@"fetched user profile picture:%@", result);
            }
        }];

        // User is logged in, do work such as go to next view controller.
        MITabBarViewController *tabController = [[MITabBarViewController alloc] init];
        [self.navigationController pushViewController:tabController animated:YES];
        self.navigationController.navigationBarHidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Button Actions
- (IBAction)facebookButtonTapped:(id)sender {
    // Once the button is clicked, show the login dialog
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile", @"email", @"user_friends"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
}

- (IBAction)signinTapped:(id)sender {
}

- (IBAction)signupTapped:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
