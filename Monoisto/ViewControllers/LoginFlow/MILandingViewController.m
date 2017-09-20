//
//  MILandingViewController.m
//  Monoisto
//
//  Created by vishal jain on 20/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import "MILandingViewController.h"

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
    
    // Status bar white font
    UIImage *img = [self getNavImage];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    [imgView setImage:img];
    // setContent mode aspect fit
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imgView;
}

-(UIImage *)getNavImage {
    CGSize imageSize = CGSizeMake(self.view.frame.size.width, 64);
    UIColor *fillColor = [UIColor colorWithRed:23/255 green:180/255 blue:192/255 alpha:1.0];
    UIGraphicsBeginImageContextWithOptions(imageSize, YES, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [fillColor setFill];
    CGContextFillRect(context, CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
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
