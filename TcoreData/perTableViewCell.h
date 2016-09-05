//
//  perTableViewCell.h
//  TcoreData
//
//  Created by bob on 16/9/5.
//  Copyright © 2016年 bob. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^delBlock)(UITableViewCell*);

@interface perTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *inforLabel;

@property(nonatomic,copy)delBlock delblock;

@end
