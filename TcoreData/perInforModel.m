//
//  perInforModel.m
//  TcoreData
//
//  Created by bob on 16/9/5.
//  Copyright © 2016年 bob. All rights reserved.
//

#import "perInforModel.h"

@implementation perInforModel


-(instancetype)initWithname:(NSString*)name andupdate:(NSDate*)update andage:(int)age andsex:(NSString*)sex
{
    if (self==[super init]) {
        
        self.name=name;
        
        self.update=update;
        
        self.age=age;

        self.sex=sex;
        
    }
    
    
    return self;
}

@end
