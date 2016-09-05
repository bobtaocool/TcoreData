//
//  addViewController.h
//  TcoreData
//
//  Created by bob on 16/9/5.
//  Copyright © 2016年 bob. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    addType=0,
    updateType=1
    
}optionType;

@interface addViewController : UIViewController

@property(nonatomic,assign)optionType type;

@property(nonatomic,copy)NSString *name;

@property(nonatomic,assign)NSInteger age;

@property(nonatomic,copy)NSString* sexType;

@end
