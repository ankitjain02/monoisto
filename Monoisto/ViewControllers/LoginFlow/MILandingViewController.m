//
//  MILandingViewController.m
//  Monoisto
//
//  Created by vishal jain on 20/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import "MILandingViewController.h"
#import "MITabBarViewController.h"

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
    
    //TODO:: Remove code later
    MITabBarViewController *tabController = [[MITabBarViewController alloc] init];
    [self.navigationController pushViewController:tabController animated:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Button Actions
- (IBAction)facebookButtonTapped:(id)sender {
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
