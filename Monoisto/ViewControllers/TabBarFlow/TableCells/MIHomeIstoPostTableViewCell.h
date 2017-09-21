//
//  MIHomeIstoPostTableViewCell.h
//  Monoisto
//
//  Created by vishal jain on 21/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIHomeIstoPostTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIScrollView *brandLogoScrollView;
@property (nonatomic, weak) IBOutlet UIImageView *displayImageView;
@property (nonatomic, weak) IBOutlet UIImageView *profileImageView;
@property (nonatomic, weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *locationAndFriendsLabel;

@end
