//
//  DetailSearchCipTableViewCell.m
//  exampleSDK
//
//  Created by gerardo on 24/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import "DetailSearchCipTableViewCell.h"

@implementation DetailSearchCipTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _viewMain.layer.cornerRadius = 3.0;
    _viewMain.layer.masksToBounds = false;
    _viewMain.layer.shadowColor = [[[UIColor blackColor] colorWithAlphaComponent:(0.2)] CGColor];
    _viewMain.layer.shadowOffset = CGSizeMake(0,0);
    _viewMain.layer.shadowOpacity = 0.8;
    self.contentView.backgroundColor = [[UIColor alloc]initWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:240/255.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
