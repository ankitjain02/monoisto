//
//  MIWardrobeTableHeaderView.h
//  Monoisto
//
//  Created by vishal jain on 27/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIWardrobeTableHeaderView : UIView

+(id)header;

@property (nonatomic, weak) IBOutlet UIView *contentView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *countLabel;

@end
