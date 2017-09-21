//
//  MIHomeViewController.m
//  Monoisto
//
//  Created by vishal jain on 21/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import "MIHomeViewController.h"
#import "MIHomeIstoPostTableViewCell.h"

@interface MIHomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *homeTableView;

@end

@implementation MIHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"title";
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;
    // Test
    // Register Nib
    NSBundle *bundleForCell = [NSBundle bundleForClass:[MIHomeIstoPostTableViewCell class]];
    [self.homeTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MIHomeIstoPostTableViewCell class]) bundle:bundleForCell] forCellReuseIdentifier:NSStringFromClass([MIHomeIstoPostTableViewCell class])];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data Source 

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 433.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MIHomeIstoPostTableViewCell *homePostCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MIHomeIstoPostTableViewCell class])];
    
    if (homePostCell == nil) {
        homePostCell = (MIHomeIstoPostTableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([MIHomeIstoPostTableViewCell class])];
    }
    
    if (indexPath.row == 0) {
        // Settinge image
        [homePostCell.displayImageView setImage:[UIImage imageNamed:@"image1"]];
        [homePostCell.profileImageView setImage:[UIImage imageNamed:@"profile_icon"]];
        
        [homePostCell.userNameLabel setText:@"Sarah J"];
        [homePostCell.locationAndFriendsLabel setText:@"Kauai, Hawai with 2 friends"];
        [self addImageOnScrollView:homePostCell.brandLogoScrollView];
    } else {
        // Settinge image
        [homePostCell.displayImageView setImage:[UIImage imageNamed:@"image2"]];
        [homePostCell.profileImageView setImage:[UIImage imageNamed:@"profile_icon"]];
        
        [homePostCell.userNameLabel setText:@"Gary Sullivan"];
        [homePostCell.locationAndFriendsLabel setText:@"London, UK with 3 friends"];
        [self addImageOnScrollView:homePostCell.brandLogoScrollView];
    }
    
    return homePostCell;
}

-(void)addImageOnScrollView:(UIScrollView *)scrollView {
    CGFloat xOffset = 0;
    CGFloat yOffSet = 0;
    
    for (int i = 1; i <= 4; i++) {
        UIImageView *logoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"image-%d", i]]];
        [logoImage setFrame:CGRectMake(xOffset, yOffSet, 40, 40)];
        
        [scrollView addSubview:logoImage];
        
        yOffSet += 40;
    }
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
