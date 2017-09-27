//
//  MIWardrobeTableHeaderView.m
//  Monoisto
//
//  Created by vishal jain on 27/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import "MIWardrobeTableHeaderView.h"

@implementation MIWardrobeTableHeaderView

+(id)header {
    MIWardrobeTableHeaderView *headerView = [[MIWardrobeTableHeaderView alloc] init];
    
    if (headerView) {
        headerView.contentView = [[[NSBundle mainBundle] loadNibNamed:@"MIWardrobeTableHeaderView" owner:self options:nil] firstObject];
        return headerView.contentView;
    }
    
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
