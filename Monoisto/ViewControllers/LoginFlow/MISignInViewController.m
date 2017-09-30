//
//  MISignInViewController.m
//  Monoisto
//
//  Created by vishal jain on 20/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import "MISignInViewController.h"

@interface MISignInViewController ()

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@property (nonatomic, weak) IBOutlet UITextField *emailTextField;
@property (nonatomic, weak) IBOutlet UITextField *pswdTextField;

@property (nonatomic, weak) IBOutlet UIButton *showPswdBtn;
@property (nonatomic, weak) IBOutlet UIButton *forgotPswdBtn;

@end

@implementation MISignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Make name text field first responder
    [self.emailTextField becomeFirstResponder];
}

-(void)viewWillAppear:(BOOL)animated {
    // Hide Navigation Bar
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Action

-(IBAction)showPswdBtnTapped:(id)sender {
    // Show Password
    [self.pswdTextField setSecureTextEntry:!self.pswdTextField.isSecureTextEntry];
}

-(IBAction)forgotPasswordBtnTapped:(id)sender {
    // Forgot Password
}

-(IBAction)continueBtnTapped:(id)sender {
    // Continue Button
}

-(IBAction)backBtnTapped:(id)sender {
    // Back Button
}

#pragma mark - Text Field Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
