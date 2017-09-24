//
//  MIHomeViewController.m
//  Monoisto
//
//  Created by vishal jain on 21/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import "MIHomeViewController.h"
#import "MIHomeIstoPostTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface MIHomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *imagesArray;
@property (nonatomic, weak) IBOutlet UITableView *homeTableView;

@end

@implementation MIHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"title";
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;

    self.imagesArray = [NSMutableArray array];
    [self.imagesArray addObject:@"http://cloudfront.zoomtv.com/story/padmavati-first-look-poster-deepika-padukone_0.jpg"];
    [self.imagesArray addObject:@"http://media.glamsham.com/download/poster/images/newton/02-newton.jpg"];
    [self.imagesArray addObject:@"http://www.bollywoodlife.com/wp-content/uploads/2017/08/DHfGMZQVwAE6pET.jpg"];
    
    // Register Nib
    NSBundle *bundleForCell = [NSBundle bundleForClass:[MIHomeIstoPostTableViewCell class]];
    [self.homeTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MIHomeIstoPostTableViewCell class]) bundle:bundleForCell] forCellReuseIdentifier:NSStringFromClass([MIHomeIstoPostTableViewCell class])];
    
    // Navigation Buttons
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_menu"] style:UIBarButtonItemStyleDone target:self action:@selector(leftMenuButtonTapped:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_search"] style:UIBarButtonItemStyleDone target:self action:@selector(rightSearchButtonTapped:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation Bar Buttons

-(void)leftMenuButtonTapped:(id)sender {
    
}

-(void)rightSearchButtonTapped:(id)sender {
    
}

#pragma mark - Table View Data Source 

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.imagesArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 433.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MIHomeIstoPostTableViewCell *homePostCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MIHomeIstoPostTableViewCell class])];
    
    if (homePostCell == nil) {
        homePostCell = (MIHomeIstoPostTableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([MIHomeIstoPostTableViewCell class])];
    }
    
    NSURL *imageUrl = [self.imagesArray objectAtIndex:indexPath.row];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.center = homePostCell.displayImageView.center;
    [indicator startAnimating];
    [homePostCell.displayImageView addSubview:indicator];
    
    [homePostCell.displayImageView sd_setImageWithURL:imageUrl completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [indicator stopAnimating];
        [indicator removeFromSuperview];
    }];
    
    if (indexPath.row == 0) {
        // Settinge image
        [homePostCell.profileImageView setImage:[UIImage imageNamed:@"profile_icon"]];
        
        [homePostCell.userNameLabel setText:@"Sarah J"];
        [homePostCell.locationAndFriendsLabel setText:@"Kauai, Hawai with 2 friends"];
        [self addImageOnScrollView:homePostCell.brandLogoScrollView];
    } else {
        // Settinge image
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
        UIImageView *logoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon%d", i]]];
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
