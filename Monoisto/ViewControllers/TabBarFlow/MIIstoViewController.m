//
//  MIIstoViewController.m
//  Monoisto
//
//  Created by vishal jain on 21/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import "MIIstoViewController.h"

// Cells
#import "MIFinalLookPictureCell.h"
#import "MIWhatAreYouWearingCell.h"
#import "MIWhomAreYourMeetingCell.h"
#import "MIWhereAreYouGoingCell.h"

static NSString *kFinalLookCellID = @"MIFinalLookPictureCell";
static NSString *kWhatAreYouWearingCellID = @"MIWhatAreYouWearingCell";
static NSString *kWhomAreYouMeetingCellID = @"MIWhomAreYourMeetingCell";
static NSString *kWhereAreYouGoingCellID = @"MIWhereAreYouGoingCell";

typedef NS_ENUM(NSInteger, ISTOCellType) {
    ISTOCellTypeFinalLook,
    ISTOCellTypeWhatAreYouWearing,
    ISTOCellTypeWhereAreYouGoing,
    ISTOCellTypeWhomAreYouMeeting
};

@interface ISTOCellData : NSObject

@property (nonatomic) ISTOCellType cellType;

@end

@implementation ISTOCellData

-(instancetype)initWithCellType:(ISTOCellType)type {
    if(self = [super init] ) {
        _cellType = type;
    }
    return self;
}

@end

@interface MIIstoViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *istoTableData;
@property (nonatomic, weak) IBOutlet UITableView *istoTableView;

@end

@implementation MIIstoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"title";
    self.istoTableView.delegate = self;
    self.istoTableView.dataSource = self;
    
    // Navigation Buttons
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_menu"] style:UIBarButtonItemStyleDone target:self action:@selector(leftMenuButtonTapped:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"save" style:UIBarButtonItemStyleDone target:self action:@selector(rightSaveButtonTapped:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    // Register Table Cell Nibs
    [self registerNibs];
    
    // Array
    self.istoTableData = [NSMutableArray array];
    [self.istoTableData addObject:[[ISTOCellData alloc] initWithCellType:ISTOCellTypeFinalLook]];
    [self.istoTableData addObject:[[ISTOCellData alloc] initWithCellType:ISTOCellTypeWhatAreYouWearing]];
    [self.istoTableData addObject:[[ISTOCellData alloc] initWithCellType:ISTOCellTypeWhereAreYouGoing]];
    [self.istoTableData addObject:[[ISTOCellData alloc] initWithCellType:ISTOCellTypeWhomAreYouMeeting]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerNibs {
    // Register Nib
    NSBundle *bundle1 = [NSBundle bundleForClass:[MIFinalLookPictureCell class]];
    [self.istoTableView registerNib:[UINib nibWithNibName:kFinalLookCellID bundle:bundle1] forCellReuseIdentifier:kFinalLookCellID];
    
    NSBundle *bundle2 = [NSBundle bundleForClass:[MIWhatAreYouWearingCell class]];
    [self.istoTableView registerNib:[UINib nibWithNibName:kWhatAreYouWearingCellID bundle:bundle2] forCellReuseIdentifier:kWhatAreYouWearingCellID];
    
    NSBundle *bundle3 = [NSBundle bundleForClass:[MIWhereAreYouGoingCell class]];
    [self.istoTableView registerNib:[UINib nibWithNibName:kWhereAreYouGoingCellID bundle:bundle3] forCellReuseIdentifier:kWhereAreYouGoingCellID];
    
    NSBundle *bundle4 = [NSBundle bundleForClass:[MIWhomAreYourMeetingCell class]];
    [self.istoTableView registerNib:[UINib nibWithNibName:kWhomAreYouMeetingCellID bundle:bundle4] forCellReuseIdentifier:kWhomAreYouMeetingCellID];
}

#pragma mark - Navigation Bar Buttons

-(void)leftMenuButtonTapped:(id)sender {
    
}

-(void)rightSaveButtonTapped:(id)sender {
    
}

#pragma mark - Table View Data Source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.istoTableData count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ISTOCellData *data = [self.istoTableData objectAtIndex:indexPath.row];
    
    if (data.cellType == ISTOCellTypeFinalLook) {
        return 190.0f; // Final Look Picture Cell
    } else if (data.cellType == ISTOCellTypeWhatAreYouWearing) {
        return 100.0f; // What are you wearing Cell
    } else if (data.cellType == ISTOCellTypeWhereAreYouGoing) {
        return 90.0f; // Where are you going cell Cell
    } else if (data.cellType == ISTOCellTypeWhomAreYouMeeting) {
        return 100.0f; // Whom are you meeting Cell
    }
    
    return 0.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ISTOCellData *data = [self.istoTableData objectAtIndex:indexPath.row];
    
    if (data.cellType == ISTOCellTypeFinalLook) {
        // Final Look Picture Cell
        MIFinalLookPictureCell *finalLookPictureCell = [tableView dequeueReusableCellWithIdentifier:kFinalLookCellID];
        
        if (finalLookPictureCell == nil) {
            finalLookPictureCell = (MIFinalLookPictureCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kFinalLookCellID];
        }
        
        [finalLookPictureCell.profileImage setImage:[UIImage imageNamed:@"profile_icon"]];
        [finalLookPictureCell.titleLabel setText:@"post a picture of your final look"];
        [finalLookPictureCell.displayPicture setImage:[UIImage imageNamed:@"camera"]];
        
        return finalLookPictureCell;
    } else if (data.cellType == ISTOCellTypeWhatAreYouWearing) {
        // What are you wearing Cell
        MIWhatAreYouWearingCell *whatAreYouWearingCell = [tableView dequeueReusableCellWithIdentifier:kWhatAreYouWearingCellID];
        
        if (whatAreYouWearingCell == nil) {
            whatAreYouWearingCell = (MIWhatAreYouWearingCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kWhatAreYouWearingCellID];
        }
        
        [whatAreYouWearingCell.iconImageView setImage:[UIImage imageNamed:@"tab_wardrobe"]];
        [whatAreYouWearingCell.titleLabel setText:@"what are you wearing?"];
        [self addImageOnScrollView:whatAreYouWearingCell.scrollView];
        
        return whatAreYouWearingCell;
    } else if (data.cellType == ISTOCellTypeWhereAreYouGoing) {
        // Where are you going cell Cell
        MIWhereAreYouGoingCell *whereAreYouGoingCell = [tableView dequeueReusableCellWithIdentifier:kWhereAreYouGoingCellID];
        
        if (whereAreYouGoingCell == nil) {
            whereAreYouGoingCell = (MIWhereAreYouGoingCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kWhereAreYouGoingCellID];
        }
        
        [whereAreYouGoingCell.titleLabel setText:@"where are you going?"];
        [whereAreYouGoingCell.locationLabel setText:@"add location"];
        [whereAreYouGoingCell.iconImageView setImage:[UIImage imageNamed:@"tab_wardrobe"]];
        
        return whereAreYouGoingCell;
    } else if (data.cellType == ISTOCellTypeWhomAreYouMeeting) {
        // Whom are you meeting Cell
        MIWhomAreYourMeetingCell *whomAreYourMeetingCell = [tableView dequeueReusableCellWithIdentifier:kWhomAreYouMeetingCellID];
        
        if (whomAreYourMeetingCell == nil) {
            whomAreYourMeetingCell = (MIWhomAreYourMeetingCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kWhomAreYouMeetingCellID];
        }

        [whomAreYourMeetingCell.iconImageView setImage:[UIImage imageNamed:@"tab_wardrobe"]];
        [whomAreYourMeetingCell.titleLabel setText:@"whom are you meeting?"];
        [self addImageOnScrollView:whomAreYourMeetingCell.scrollView];
        
        return whomAreYourMeetingCell;
    } else {
        return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"defaultCell"];
    }
}

-(void)addImageOnScrollView:(UIScrollView *)scrollView {
    CGFloat xOffset = 0;
    CGFloat yOffSet = 0;
    
    for (int i = 1; i <= 4; i++) {
        UIImageView *logoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon%d", i]]];
        [logoImage setFrame:CGRectMake(xOffset, yOffSet, 40, 40)];
        
        [scrollView addSubview:logoImage];
        
        xOffset += 40 + 10;
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
