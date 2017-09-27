//
//  MIWardrobeViewController.m
//  Monoisto
//
//  Created by vishal jain on 21/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import "MIWardrobeViewController.h"
#import "MIWardrobeListTableViewCell.h"
#import "MIWardrobeIndividualView.h"
#import "MIWardrobeTableHeaderView.h"
#import "MIWardrobeIndividualData.h"

static NSString *kWardroibeListCellID = @"MIWardrobeListTableViewCell";

@interface MIWardrobeViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSMutableSet* _collapsedSections;
}

@property (nonatomic, strong) NSMutableArray *wardrobeArray;
@property (nonatomic, weak) IBOutlet UITableView *wardrobeTableView;

@end

@implementation MIWardrobeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _collapsedSections = [NSMutableSet new];
    
    self.navigationItem.title = @"title";
    self.wardrobeTableView.delegate = self;
    self.wardrobeTableView.dataSource = self;
    
    self.wardrobeArray = [NSMutableArray array];
    
    MIWardrobeIndividualData *data1 = [MIWardrobeIndividualData new];
    data1.displayImage = @"icon1";
    data1.title = @"shirt";
    data1.count = @"32";
    [self.wardrobeArray addObject:data1];
    
    MIWardrobeIndividualData *data2 = [MIWardrobeIndividualData new];
    data2.displayImage = @"icon2";
    data2.title = @"t-shirt";
    data2.count = @"10";
    [self.wardrobeArray addObject:data2];
    
    MIWardrobeIndividualData *data3 = [MIWardrobeIndividualData new];
    data3.displayImage = @"icon3";
    data3.title = @"jackets";
    data3.count = @"5";
    [self.wardrobeArray addObject:data3];
    
    MIWardrobeIndividualData *data4 = [MIWardrobeIndividualData new];
    data4.displayImage = @"icon4";
    data4.title = @"pants";
    data4.count = @"8";
    [self.wardrobeArray addObject:data4];
    
    MIWardrobeIndividualData *data5 = [MIWardrobeIndividualData new];
    data5.displayImage = @"icon5";
    data5.title = @"shorts";
    data5.count = @"4";
    [self.wardrobeArray addObject:data5];
    
    // Register Nib
    NSBundle *bundle1 = [NSBundle bundleForClass:[MIWardrobeListTableViewCell class]];
    [self.wardrobeTableView registerNib:[UINib nibWithNibName:kWardroibeListCellID bundle:bundle1] forCellReuseIdentifier:kWardroibeListCellID];
    
    // Navigation Buttons
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_menu"] style:UIBarButtonItemStyleDone target:self action:@selector(leftMenuButtonTapped:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(rightPlusButtonTapped:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation Bar Buttons

-(void)leftMenuButtonTapped:(id)sender {
    
}

-(void)rightPlusButtonTapped:(id)sender {
    
}

#pragma mark - Table View Data Source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.wardrobeArray count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_collapsedSections containsObject:@(section)] ? 1 : 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 220.0f;
}

-(void)headerViewTapped:(UITapGestureRecognizer *)gesture {
    int section = (int)gesture.view.tag;
    BOOL shouldCollapse = ![_collapsedSections containsObject:@(section)];
    if (shouldCollapse) {
        [_collapsedSections addObject:@(section)];
    } else {
        [_collapsedSections removeObject:@(section)];
    }
    
    [self.wardrobeTableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationNone];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    MIWardrobeIndividualData *data = [self.wardrobeArray objectAtIndex:section];
    
    MIWardrobeTableHeaderView *headerView = [MIWardrobeTableHeaderView header];
    [headerView.titleLabel setText:data.title];
    [headerView.countLabel setText:data.count];
    
    [headerView.contentView setUserInteractionEnabled:YES];
    
    // Tap gesture
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerViewTapped:)];
    [headerView.contentView setTag:section];
    [headerView.contentView addGestureRecognizer:tapGesture];
    
    return headerView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MIWardrobeListTableViewCell *wardrobeListCell = [tableView dequeueReusableCellWithIdentifier:kWardroibeListCellID];
    
    if (wardrobeListCell == nil) {
        wardrobeListCell = (MIWardrobeListTableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kWardroibeListCellID];
    }
    
    [self addImageOnScrollView:wardrobeListCell.listScrollView forSection:indexPath.section];
    wardrobeListCell.listScrollView.tag = 1000 + indexPath.section;
    wardrobeListCell.listScrollView.delegate = self;
    [wardrobeListCell.listScrollView setShowsVerticalScrollIndicator:NO];
    
    return wardrobeListCell;
}

-(void)addImageOnScrollView:(UIScrollView *)scrollView forSection:(NSInteger)section {
    
    // Remove the existing Views before adding new ones
    for (UIView *subView in [scrollView subviews]) {
        if ([subView isKindOfClass:[MIWardrobeIndividualView class]]) {
            [subView removeFromSuperview];
        }
    }
    
    // Add the individual cells again
    CGFloat xOffset = 0;
    CGFloat yOffSet = 0;
    
    MIWardrobeIndividualData *data = [self.wardrobeArray objectAtIndex:section];

    for (int i = 1; i <= 4; i++) {
        
        MIWardrobeIndividualView *cell = [MIWardrobeIndividualView getWardrobeIndividualView];
        [cell setFrame:CGRectMake(xOffset, yOffSet, 160, 220)];
        
        [cell.displayImageView setImage:[UIImage imageNamed:data.displayImage]];
        [cell.titleLabel setText:[NSString stringWithFormat:@"%@ - %d", data.title, i]];
        [cell.detailLabel setText:[NSString stringWithFormat:@"%d - %@", i, data.title]];
        
        [scrollView addSubview:cell];
        
        xOffset += cell.frame.size.width + 10;
    }
    
    // To set the scrolling
    scrollView.contentSize = CGSizeMake(xOffset, scrollView.frame.size.width);
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
