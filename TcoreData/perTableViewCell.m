//
//  perTableViewCell.m
//  TcoreData
//
//  Created by bob on 16/9/5.
//  Copyright © 2016年 bob. All rights reserved.
//

#import "perTableViewCell.h"

@implementation perTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (IBAction)delBtn:(UIButton *)sender {
    
    _delblock(self);
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
